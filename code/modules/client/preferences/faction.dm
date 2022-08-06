/// What faction is our character in, if any?
/datum/preference/choiced/faction
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	can_randomize = FALSE
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "char_faction"

// This is what that #warn wants you to remove :)
/datum/preference/choiced/faction/deserialize(input, datum/preferences/preferences)
	if (!(input in GLOB.northstar_factions_prefs))
		return NS_FAC_NONE
	return ..(input, preferences)

/datum/preference/choiced/faction/init_possible_values()
	return GLOB.northstar_factions_prefs

/datum/preference/choiced/faction/apply_to_human(mob/living/carbon/human/target, value)
	var/obj/item/card/id/our_id = target.get_idcard()
	var/finished_value //Defined here because this if else cascade /exists/. I'm sorry, I'm the stupif
	// And the lord wept, for the if else cascade began.
	if (value == NS_FAC_NONE)
		return
	if (value == NS_FAC_UNITY)
		finished_value = ACCESS_UNITY
	if (value == NS_FAC_HOMEGUARD)
		finished_value = ACCESS_HOME_GUARD
	if (value == NS_FAC_CHIRON)
		finished_value = ACCESS_CHIRON_BIOLABS
	if (value == NS_FAC_MEKHANE)
		finished_value = ACCESS_MEKHANE
	if (value == NS_FAC_CONSERVATORS)
		finished_value = ACCESS_CONSERVATORS
	our_id.access += finished_value

/datum/preference/choiced/faction/create_default_value()
	return NS_FAC_NONE

/datum/preference/choiced/faction/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
