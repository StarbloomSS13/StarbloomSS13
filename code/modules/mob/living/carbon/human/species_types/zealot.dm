/datum/species/zealot
	name = "\improper Zealot"
	id = SPECIES_ZEALOT
	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,HAS_FLESH,HAS_BONE)
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_NOHUNGER,
		TRAIT_RESISTCOLD,
		TRAIT_NOCLONELOSS,
		TRAIT_GENELESS,
		TRAIT_RADIMMUNE,
	)
	mutant_bodyparts = list("wings" = "None")
	use_skintones = 0
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = GROSS | RAW | CLOTH
	liked_food = JUNKFOOD | FRIED
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	payday_modifier = 1
	sexes = 0
	burnmod = 0.9
	brutemod = 0.9

	bodypart_overrides = list(
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/zealot,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/zealot,
		BODY_ZONE_HEAD = /obj/item/bodypart/head/zealot,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/zealot,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/zealot,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/zealot,
	)

	species_pain_modifier = 0.8

/datum/species/zealot/prepare_human_for_preview(mob/living/carbon/human/zealot)
	zealot.hairstyle = "Shaved"
	zealot.hair_color = "#e6e6e6" // white
	zealot.update_hair()

/datum/species/zealot/get_scream_sound(mob/living/carbon/human/zealot)
	if(zealot.gender == MALE)
		if(prob(1))
			return 'sound/voice/human/wilhelm_scream.ogg'
		return pick(
			'sound/voice/human/malescream_1.ogg',
			'sound/voice/human/malescream_2.ogg',
			'sound/voice/human/malescream_3.ogg',
			'sound/voice/human/malescream_4.ogg',
			'sound/voice/human/malescream_5.ogg',
			'sound/voice/human/malescream_6.ogg',
		)

	return pick(
		'sound/voice/human/femalescream_1.ogg',
		'sound/voice/human/femalescream_2.ogg',
		'sound/voice/human/femalescream_3.ogg',
		'sound/voice/human/femalescream_4.ogg',
		'sound/voice/human/femalescream_5.ogg',
	)

/datum/species/zealot/get_species_description()
	return "These things used to be human, until the Last Edict got their hands on them."

/datum/species/zealot/get_species_lore()
	return list(
		"These things used to be human, until the Last Edict got their hands on them."
	)
