/datum/opposing_force_equipment/melee
	category = OPFOR_EQUIPMENT_CATEGORY_MELEE_WEAPONS

/datum/opposing_force_equipment/melee/switchblade
	item_type = /obj/item/switchblade

/datum/opposing_force_equipment/melee/metalbat
	item_type = /obj/item/melee/baseball_bat/ablative
	description = "A highly reflective baseball bat for when you need to crack skulls and run away from security in the same night. Can reflect lasers."

/// I've opted not to mark energy swords as Edict weapons. While it's most likely they'd be the ones to have them, it's not impossible for another faction to as well.
/// Mins should be mindful of plausibility when handing these out considering the HOS' is the only legal one on the North Star.
/datum/opposing_force_equipment/melee/esword
	item_type = /obj/item/melee/energy/sword
	description = "The energy sword is an edged weapon with a blade of pure energy, Reverse engineered from the Head of Security's own. \
	Can be pocketed while inactive, though produces a loud, distinctive sound when unleashed."

/datum/opposing_force_equipment/melee/epirate
	item_type = /obj/item/melee/energy/sword/pirate
	description = "A variant of the energy sword styled as a cutlass. Pirate costume sold separately. Warranty void if bought."

/datum/opposing_force_equipment/melee/edagger
	item_type = /obj/item/pen/edagger
	name = "Energy Dagger"
	description = "A miniaturized energy sword hidden inside a functional pen."

/datum/opposing_force_equipment/melee/bane_of_unity
	item_type = /obj/item/melee/energy/sword/bane_of_unity
	name = "Last Edict - Bane Of Unity"
	description = "A direct upgrade to traditional energy swords, able to trade severe stamina damage and 10u of your blood for \
	an armor-piercing laser shot! Unfortunately, this being alien technology tends to make it obvious who's side you're truly on - \
	and, should you lack protection, make your mind fester and boil into nothing but a raving madman."
	admin_note = "Direct upgrade to an Energy Sword. Secondary attack Trades 25 Stamina damage and 10u blood for 15 Damage, 50% Armor Piercing Laser Shots. \
	Only the Last Edict or their direct sympathizers would have this, and anyone without the Edict's mindshield would be driven mad. Take this all into consideration."

/datum/opposing_force_equipment/melee/cutlass
	item_type = /obj/item/claymore/cutlass

/datum/opposing_force_equipment/melee/claymore
	item_type = /obj/item/claymore
	description = "An extremely sharp and robust sword perfect to cleave through any opposition. Also highly illegal. \
	Scottish pride not provided."

/datum/opposing_force_equipment/melee/katana
	item_type = /obj/item/katana
	description = "An extremely sharp and robust sword folded over nine thousand times until perfection. Highly lethal and illegal."

/datum/opposing_force_equipment/melee/ekatana
	item_type = /obj/item/energy_katana
	description = "An energy katana seized from a dead Spider Clan ninja. As well as being highly robust, it allows the \
		user to teleport short distances using right-click."

/datum/opposing_force_equipment/melee/powerfist
	item_type = /obj/item/melee/powerfist
	name = "Power Fist"
	description = "The power-fist is a metal gauntlet with a built-in piston-ram powered by an external gas supply.\
		Upon hitting a target, the piston-ram will extend forward to make contact for some serious damage. \
		Using a wrench on the piston valve will allow you to tweak the amount of gas used per punch to \
		deal extra damage and hit targets further. Use a screwdriver to take out any attached tanks."

/datum/opposing_force_equipment/melee/northstar
	item_type = /obj/item/clothing/gloves/rapid
	description = "By putting on these gloves, you will find you can punch things at vastly increased speed."

/datum/opposing_force_equipment/melee/hfblade
	item_type = /obj/item/highfrequencyblade
	admin_note = "WARNING: Wizard Gear. High AP, Low attack delay. Approve with caution."
