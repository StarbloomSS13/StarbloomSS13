/datum/preference/toggle/allow_mismatched_parts
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "allow_mismatched_parts_toggle"
	default_value = FALSE

/datum/preference/toggle/allow_mismatched_parts/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return TRUE // we dont actually want this to do anything

/datum/preference/toggle/allow_emissives
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "allow_emissives_toggle" //no 'e' so it goes right after allow_mismatched_parts, not before
	default_value = FALSE

/datum/preference/toggle/allow_emissives/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return TRUE // we dont actually want this to do anything

/datum/preference/tri_color/mutant_colors
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "mutant_colors_color"
	check_mode = TRICOLOR_NO_CHECK

/datum/preference/tri_color/mutant_colors/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["mcolor"] = sanitize_hexcolor(value[1])
	target.dna.features["mcolor2"] = sanitize_hexcolor(value[2])
	target.dna.features["mcolor3"] = sanitize_hexcolor(value[3])

/datum/preference/toggle/eye_emissives
	savefile_key = "eye_emissives"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_species_trait = EYECOLOR

/datum/preference/toggle/eye_emissives/apply_to_human(mob/living/carbon/human/target, value)
	var/obj/item/organ/eyes/eyes_organ = target.getorgan(/obj/item/organ/eyes)
	target.emissive_eyes = TRUE
	if (istype(eyes_organ))
		eyes_organ.is_emissive = value

/datum/preference/toggle/eye_emissives/create_default_value()
	return FALSE

/datum/preference/toggle/eye_emissives/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_emissives)
	return passed_initial_check && allowed


// Body Markings

/datum/preference/toggle/body_markings
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "body_markings_toggle"
	relevant_mutant_bodypart = "body_markings"
	default_value = FALSE

/datum/preference/toggle/body_markings/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return TRUE // we dont actually want this to do anything

/datum/preference/toggle/body_markings/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	return passed_initial_check || allowed

/datum/preference/choiced/body_markings
	savefile_key = "feature_body_markings"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_mutant_bodypart = "body_markings"

/datum/preference/choiced/body_markings/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	var/part_enabled = preferences.read_preference(/datum/preference/toggle/body_markings)
	return ((passed_initial_check || allowed) && part_enabled)

/datum/preference/choiced/body_markings/init_possible_values()
	return assoc_to_keys(GLOB.sprite_accessories["body_markings"])

/datum/preference/choiced/body_markings/apply_to_human(mob/living/carbon/human/target, value)
	if(!target.dna.mutant_bodyparts[relevant_mutant_bodypart])
		target.dna.mutant_bodyparts[relevant_mutant_bodypart] = list(MUTANT_INDEX_NAME = "None", MUTANT_INDEX_COLOR_LIST = list("#FFFFFF", "#FFFFFF", "#FFFFFF"), MUTANT_INDEX_EMISSIVE_LIST = list(FALSE, FALSE, FALSE))
	target.dna.mutant_bodyparts[relevant_mutant_bodypart][MUTANT_INDEX_NAME] = value

/datum/preference/choiced/body_markings/create_default_value()
	var/datum/sprite_accessory/body_markings/none/default = /datum/sprite_accessory/body_markings/none
	return initial(default.name)

/datum/preference/tri_color/body_markings
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "body_markings_color"
	relevant_mutant_bodypart = "body_markings"
	type_to_check = /datum/preference/toggle/body_markings

/datum/preference/tri_bool/body_markings
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "body_markings_emissive"
	relevant_mutant_bodypart = "body_markings"
	type_to_check = /datum/preference/toggle/body_markings

/// Tails

/datum/preference/toggle/tail
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "tail_toggle"
	relevant_mutant_bodypart = "tail"
	default_value = FALSE

/datum/preference/toggle/tail/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return TRUE // we dont actually want this to do anything

/datum/preference/toggle/tail/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	return passed_initial_check || allowed

/datum/preference/choiced/tail
	savefile_key = "feature_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_mutant_bodypart = "tail"

/datum/preference/choiced/tail/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	var/part_enabled = preferences.read_preference(/datum/preference/toggle/tail)
	return ((passed_initial_check || allowed) && part_enabled)

/datum/preference/choiced/tail/init_possible_values()
	return assoc_to_keys(GLOB.sprite_accessories["tail"])

/datum/preference/choiced/tail/apply_to_human(mob/living/carbon/human/target, value)
	if(!target.dna.mutant_bodyparts[relevant_mutant_bodypart])
		target.dna.mutant_bodyparts[relevant_mutant_bodypart] = list(MUTANT_INDEX_NAME = "None", MUTANT_INDEX_COLOR_LIST = list("#FFFFFF", "#FFFFFF", "#FFFFFF"), MUTANT_INDEX_EMISSIVE_LIST = list(FALSE, FALSE, FALSE))
	target.dna.mutant_bodyparts[relevant_mutant_bodypart][MUTANT_INDEX_NAME] = value

/datum/preference/choiced/tail/create_default_value()
	var/datum/sprite_accessory/tails/none/default = /datum/sprite_accessory/tails/none
	return initial(default.name)

/datum/preference/tri_color/tail
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "tail_color"
	relevant_mutant_bodypart = "tail"
	type_to_check = /datum/preference/toggle/tail

/datum/preference/tri_bool/tail
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "tail_emissive"
	relevant_mutant_bodypart = "tail"
	type_to_check = /datum/preference/toggle/tail

/// Horns

/datum/preference/toggle/horns
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "horns_toggle"
	relevant_mutant_bodypart = "horns"
	default_value = FALSE

/datum/preference/toggle/horns/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return TRUE // we dont actually want this to do anything

/datum/preference/toggle/horns/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	return passed_initial_check || allowed

/datum/preference/choiced/horns
	savefile_key = "feature_horns"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_mutant_bodypart = "horns"

/datum/preference/choiced/horns/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	var/part_enabled = preferences.read_preference(/datum/preference/toggle/horns)
	return ((passed_initial_check || allowed) && part_enabled)

/datum/preference/choiced/horns/init_possible_values()
	return assoc_to_keys(GLOB.sprite_accessories["horns"])

/datum/preference/choiced/horns/apply_to_human(mob/living/carbon/human/target, value)
	if(!target.dna.mutant_bodyparts[relevant_mutant_bodypart])
		target.dna.mutant_bodyparts[relevant_mutant_bodypart] = list(MUTANT_INDEX_NAME = "None", MUTANT_INDEX_COLOR_LIST = list("#FFFFFF", "#FFFFFF", "#FFFFFF"), MUTANT_INDEX_EMISSIVE_LIST = list(FALSE, FALSE, FALSE))
	target.dna.mutant_bodyparts[relevant_mutant_bodypart][MUTANT_INDEX_NAME] = value

/datum/preference/choiced/horns/create_default_value()
	var/datum/sprite_accessory/horns/none/default = /datum/sprite_accessory/horns/none
	return initial(default.name)

/datum/preference/tri_color/horns
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "horns_color"
	relevant_mutant_bodypart = "horns"
	type_to_check = /datum/preference/toggle/horns

/datum/preference/tri_bool/horns
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "horns_emissive"
	relevant_mutant_bodypart = "horns"
	type_to_check = /datum/preference/toggle/horns

/// Ears

/datum/preference/toggle/ears
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "ears_toggle"
	relevant_mutant_bodypart = "ears"
	default_value = FALSE

/datum/preference/toggle/ears/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return TRUE // we dont actually want this to do anything

/datum/preference/toggle/ears/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	return passed_initial_check || allowed

/datum/preference/choiced/ears
	savefile_key = "feature_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_mutant_bodypart = "ears"

/datum/preference/choiced/ears/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	var/part_enabled = preferences.read_preference(/datum/preference/toggle/ears)
	return ((passed_initial_check || allowed) && part_enabled)

/datum/preference/choiced/ears/init_possible_values()
	return assoc_to_keys(GLOB.sprite_accessories["ears"])

/datum/preference/choiced/ears/apply_to_human(mob/living/carbon/human/target, value)
	if(!target.dna.mutant_bodyparts[relevant_mutant_bodypart])
		target.dna.mutant_bodyparts[relevant_mutant_bodypart] = list(MUTANT_INDEX_NAME = "None", MUTANT_INDEX_COLOR_LIST = list("#FFFFFF", "#FFFFFF", "#FFFFFF"), MUTANT_INDEX_EMISSIVE_LIST = list(FALSE, FALSE, FALSE))
	target.dna.mutant_bodyparts[relevant_mutant_bodypart][MUTANT_INDEX_NAME] = value

/datum/preference/choiced/ears/create_default_value()
	var/datum/sprite_accessory/ears/none/default = /datum/sprite_accessory/ears/none
	return initial(default.name)

/datum/preference/tri_color/ears
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "ears_color"
	relevant_mutant_bodypart = "ears"
	type_to_check = /datum/preference/toggle/ears

/datum/preference/tri_bool/ears
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "ears_emissive"
	relevant_mutant_bodypart = "ears"
	type_to_check = /datum/preference/toggle/ears

/// Wings

/datum/preference/toggle/wings
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "wings_toggle"
	relevant_mutant_bodypart = "wings"
	default_value = FALSE

/datum/preference/toggle/wings/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return TRUE // we dont actually want this to do anything

/datum/preference/toggle/wings/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	return passed_initial_check || allowed

/datum/preference/choiced/wings
	savefile_key = "feature_wings"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_mutant_bodypart = "wings"

/datum/preference/choiced/wings/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	var/part_enabled = preferences.read_preference(/datum/preference/toggle/wings)
	return ((passed_initial_check || allowed) && part_enabled)

/datum/preference/choiced/wings/init_possible_values()
	return assoc_to_keys(GLOB.sprite_accessories["wings"])

/datum/preference/choiced/wings/apply_to_human(mob/living/carbon/human/target, value)
	if(!target.dna.mutant_bodyparts[relevant_mutant_bodypart])
		target.dna.mutant_bodyparts[relevant_mutant_bodypart] = list(MUTANT_INDEX_NAME = "None", MUTANT_INDEX_COLOR_LIST = list("#FFFFFF", "#FFFFFF", "#FFFFFF"), MUTANT_INDEX_EMISSIVE_LIST = list(FALSE, FALSE, FALSE))
	target.dna.mutant_bodyparts[relevant_mutant_bodypart][MUTANT_INDEX_NAME] = value

/datum/preference/choiced/wings/create_default_value()
	var/datum/sprite_accessory/wings/none/default = /datum/sprite_accessory/wings/none
	return initial(default.name)

/datum/preference/tri_color/wings
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "wings_color"
	relevant_mutant_bodypart = "wings"
	type_to_check = /datum/preference/toggle/wings

/datum/preference/tri_bool/wings
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "wings_emissive"
	relevant_mutant_bodypart = "wings"
	type_to_check = /datum/preference/toggle/wings

/// Spines

/datum/preference/toggle/spines
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "spines_toggle"
	relevant_mutant_bodypart = "spines"
	default_value = FALSE

/datum/preference/toggle/spines/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return TRUE // we dont actually want this to do anything

/datum/preference/toggle/spines/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	return passed_initial_check || allowed

/datum/preference/choiced/spines
	savefile_key = "feature_spines"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_mutant_bodypart = "spines"

/datum/preference/choiced/spines/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	var/part_enabled = preferences.read_preference(/datum/preference/toggle/spines)
	return ((passed_initial_check || allowed) && part_enabled)

/datum/preference/choiced/spines/init_possible_values()
	return assoc_to_keys(GLOB.sprite_accessories["spines"])

/datum/preference/choiced/spines/apply_to_human(mob/living/carbon/human/target, value)
	if(!target.dna.mutant_bodyparts[relevant_mutant_bodypart])
		target.dna.mutant_bodyparts[relevant_mutant_bodypart] = list(MUTANT_INDEX_NAME = "None", MUTANT_INDEX_COLOR_LIST = list("#FFFFFF", "#FFFFFF", "#FFFFFF"), MUTANT_INDEX_EMISSIVE_LIST = list(FALSE, FALSE, FALSE))
	target.dna.mutant_bodyparts[relevant_mutant_bodypart][MUTANT_INDEX_NAME] = value

/datum/preference/choiced/spines/create_default_value()
	var/datum/sprite_accessory/spines/none/default = /datum/sprite_accessory/spines/none
	return initial(default.name)

/datum/preference/tri_color/spines
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "spines_color"
	relevant_mutant_bodypart = "spines"
	type_to_check = /datum/preference/toggle/spines

/datum/preference/tri_bool/spines
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "spines_emissive"
	relevant_mutant_bodypart = "spines"
	type_to_check = /datum/preference/toggle/spines

/// Snouts

/datum/preference/toggle/snout
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "snout_toggle"
	relevant_mutant_bodypart = "snout"
	default_value = FALSE

/datum/preference/toggle/snout/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return TRUE // we dont actually want this to do anything

/datum/preference/toggle/snout/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	return passed_initial_check || allowed

/datum/preference/choiced/snout
	savefile_key = "feature_snout"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_mutant_bodypart = "snout"

/datum/preference/choiced/snout/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	var/part_enabled = preferences.read_preference(/datum/preference/toggle/snout)
	return ((passed_initial_check || allowed) && part_enabled)

/datum/preference/choiced/snout/init_possible_values()
	return assoc_to_keys(GLOB.sprite_accessories["snout"])

/datum/preference/choiced/snout/apply_to_human(mob/living/carbon/human/target, value)
	if(!target.dna.mutant_bodyparts[relevant_mutant_bodypart])
		target.dna.mutant_bodyparts[relevant_mutant_bodypart] = list(MUTANT_INDEX_NAME = "None", MUTANT_INDEX_COLOR_LIST = list("#FFFFFF", "#FFFFFF", "#FFFFFF"), MUTANT_INDEX_EMISSIVE_LIST = list(FALSE, FALSE, FALSE))
	target.dna.mutant_bodyparts[relevant_mutant_bodypart][MUTANT_INDEX_NAME] = value
	var/obj/item/bodypart/head/our_head = target.get_bodypart(BODY_ZONE_HEAD)
	our_head.bodytype |= BODYTYPE_SNOUTED
	our_head.synchronize_bodytypes(target)

/datum/preference/choiced/snout/create_default_value()
	var/datum/sprite_accessory/snouts/none/default = /datum/sprite_accessory/snouts/none
	return initial(default.name)

/datum/preference/tri_color/snout
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "snout_color"
	relevant_mutant_bodypart = "snout"
	type_to_check = /datum/preference/toggle/snout

/datum/preference/tri_bool/snout
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "snout_emissive"
	relevant_mutant_bodypart = "snout"
	type_to_check = /datum/preference/toggle/snout

/// Frills

/datum/preference/toggle/frills
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "frills_toggle"
	relevant_mutant_bodypart = "frills"
	default_value = FALSE

/datum/preference/toggle/frills/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return TRUE // we dont actually want this to do anything

/datum/preference/toggle/frills/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	return passed_initial_check || allowed

/datum/preference/choiced/frills
	savefile_key = "feature_frills"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_mutant_bodypart = "frills"

/datum/preference/choiced/frills/is_accessible(datum/preferences/preferences)
	var/passed_initial_check = ..(preferences)
	var/allowed = preferences.read_preference(/datum/preference/toggle/allow_mismatched_parts)
	var/part_enabled = preferences.read_preference(/datum/preference/toggle/frills)
	return ((passed_initial_check || allowed) && part_enabled)

/datum/preference/choiced/frills/init_possible_values()
	return assoc_to_keys(GLOB.sprite_accessories["frills"])

/datum/preference/choiced/frills/apply_to_human(mob/living/carbon/human/target, value)
	if(!target.dna.mutant_bodyparts[relevant_mutant_bodypart])
		target.dna.mutant_bodyparts[relevant_mutant_bodypart] = list(MUTANT_INDEX_NAME = "None", MUTANT_INDEX_COLOR_LIST = list("#FFFFFF", "#FFFFFF", "#FFFFFF"), MUTANT_INDEX_EMISSIVE_LIST = list(FALSE, FALSE, FALSE))
	target.dna.mutant_bodyparts[relevant_mutant_bodypart][MUTANT_INDEX_NAME] = value

/datum/preference/choiced/frills/create_default_value()
	var/datum/sprite_accessory/frills/none/default = /datum/sprite_accessory/frills/none
	return initial(default.name)

/datum/preference/tri_color/frills
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "frills_color"
	relevant_mutant_bodypart = "frills"
	type_to_check = /datum/preference/toggle/frills

/datum/preference/tri_bool/frills
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "frills_emissive"
	relevant_mutant_bodypart = "frills"
	type_to_check = /datum/preference/toggle/frills

/datum/preference/toggle/skintone_toggle
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	priority = PREFERENCE_PRIORITY_GENDER //Priority is set to be higher than the species pref.
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "skintone_toggle"

/datum/preference/toggle/skintone_toggle/apply_to_human(mob/living/carbon/human/target, value)
	if(value)
		target.dna.species.species_traits -= MUTCOLORS
		target.dna.species.use_skintones = TRUE
		target.update_body_parts()
	else
		target.dna.species.species_traits |= MUTCOLORS
		target.dna.species.use_skintones = FALSE
		target.update_body_parts()

/datum/preference/toggle/skintone_toggle/create_informed_default_value(datum/preferences/preferences)
	return ispath(preferences.read_preference(/datum/preference/choiced/species), /datum/species/human)
