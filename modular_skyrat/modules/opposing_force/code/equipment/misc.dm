/datum/opposing_force_equipment/other
	category = OPFOR_EQUIPMENT_CATEGORY_OTHER

/datum/opposing_force_equipment/other/uplink
	item_type = /obj/item/uplink/opfor
	name = "Last Edict - Uplink"
	description = "A Last Edict uplink with an empty TC account. \"Disguised\" as an older model station bounced radio, but will be \
	brazenly obvious to those in the know."

/datum/opposing_force_equipment/other/tc1
	item_type = /obj/item/stack/telecrystal
	name = "1 Raw Telecrystal"
	description = "A telecrystal in its rawest and purest form; can be utilized on active uplinks to increase their telecrystal count."

/datum/opposing_force_equipment/other/tc5
	item_type = /obj/item/stack/telecrystal/five
	name = "5 Raw Telecrystals"
	description = "A bunch of telecrystals in their rawest and purest form; can be utilized on active uplinks to increase their telecrystal count."

/datum/opposing_force_equipment/other/tc20
	item_type = /obj/item/stack/telecrystal/twenty
	name = "20 Raw Telecrystals"
	description = "A bundle of telecrystals in their rawest and purest form; can be utilized on active uplinks to increase their telecrystal count."

/datum/opposing_force_equipment/other/cashcase
	item_type = /obj/item/storage/secure/briefcase/syndie
	name = "Weighted Briefcase Full of Cash"
	description = "A secure briefcase containing 5000 space credits. Useful for bribing personnel, or purchasing goods \
			and services at lucrative prices. The briefcase also feels a little heavier to hold; it has been \
			manufactured to pack a little bit more of a punch if your client needs some convincing."

/datum/opposing_force_equipment/other/c10k
	name = "10000 Space Cash Bill"
	item_type = /obj/item/stack/spacecash/c10000
	description = "Cold hard cash. When you REALLY need to bribe or buy your way in. Or to payroll your gangmembers."

/datum/opposing_force_equipment/other/ninjastar
	item_type = /obj/item/throwing_star
	description = "Be the maintenance ninja you always wanted to be. Does not come with multi-throwing cybernetics."

/datum/opposing_force_equipment/other/throwing_weapons
	name = "Box of Throwing Weapons"
	item_type = /obj/item/storage/box/edict_kit/throwing_weapons
	description = "A box of shurikens and reinforced bolas from ancient Earth martial arts. They are highly effective \
		throwing weapons. The bolas can knock a target down and the shurikens will embed into limbs."
	name = "Box of Throwing Weapons"

/datum/opposing_force_equipment/other/origami
	item_type = /obj/item/storage/box/edict_kit/origami_bundle
	description = "A box containing a guide on how to craft masterful works of origami, allowing you to transform normal pieces of paper into \
		perfectly aerodynamic (and potentially lethal) paper airplanes."

/datum/opposing_force_equipment/other/surplus
	name = "Last Edict - Surplus Crate"
	item_type = /obj/effect/gibspawner/generic
	description = "The zealots are offering a crate of surplus equipment for agents willing to take the odds. It contains a variety of useful items, \
		but there's no guarantee any of it will be applicable to your needs. Contents equal to 50 TC."
	admin_note = "WARNING: There is no guarantee of what will come out of this. Contents equal to 50 TC."
	var/telecrystal_count = 50

/datum/opposing_force_equipment/other/surplus/on_issue(mob/living/target)
	var/list/uplink_items = list()
	var/obj/structure/closet/crate/holder_crate = new(get_turf(target))
	for(var/datum/uplink_item/item_path as anything in SStraitor.uplink_items_by_type)
		var/datum/uplink_item/item = SStraitor.uplink_items_by_type[item_path]
		if(item.purchasable_from & UPLINK_TRAITORS)
			uplink_items += item

	while(telecrystal_count)
		var/datum/uplink_item/uplink_item = pick(uplink_items)
		if(!uplink_item.surplus || prob(100 - uplink_item.surplus))
			continue
		if(telecrystal_count < uplink_item.cost)
			continue
		if(!uplink_item.item)
			continue
		telecrystal_count -= uplink_item.cost
		new uplink_item.item(holder_crate)

/datum/opposing_force_equipment/other/surplus/super
	name = "Last Edict - Super Surplus Crate"
	description = "The zealots have reserved a reserve of especially valuable items for high priority missions. While there's no guarantee \
		any of these will be applicable to your needs, the sheer volume of items should ensure you will find at least some equipment for \
		your personal niche, and possibly another agent's! Contents equal to 125 TC."
	telecrystal_count = 125
	admin_note = "WARNING: Extremely high TC count, absolutely no guarantee whatsoever of what will come out of this. Contents equal to 125 TC."
