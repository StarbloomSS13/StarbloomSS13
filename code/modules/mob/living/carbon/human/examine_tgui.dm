/datum/examine_panel
	var/mob/living/holder //client of whoever is using this datum

/datum/examine_panel/ui_state(mob/user)
	return GLOB.always_state

/datum/examine_panel/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ExaminePanel")
		ui.open()

/datum/examine_panel/ui_data(mob/user)
	var/list/data = list()

	var/datum/preferences/preferences = holder.client?.prefs

	var/flavor_text
	var/obscured
	var/headshot = ""

	// Now we handle silicon and/or human, order doesn't really matter
	// If other variants of mob/living need to be handled at some point, put them here
	if(issilicon(holder))
		flavor_text = preferences.read_preference(/datum/preference/text/silicon_flavor_text)
		headshot += preferences.read_preference(/datum/preference/text/headshot)

	if(ishuman(holder))
		var/mob/living/carbon/human/holder_human = holder
		obscured = (holder_human.wear_mask && (holder_human.wear_mask.flags_inv & HIDEFACE)) || (holder_human.head && (holder_human.head.flags_inv & HIDEFACE))
		flavor_text = obscured ? "Obscured" :  holder_human.dna.features["flavor_text"]
		if(!obscured)
			headshot += holder_human.dna.features["headshot"]

	var/name = obscured ? "Unknown" : holder.name

	data["obscured"] = obscured ? TRUE : FALSE
	data["character_name"] = name
	data["flavor_text"] = flavor_text
	data["headshot"] = headshot
	return data
