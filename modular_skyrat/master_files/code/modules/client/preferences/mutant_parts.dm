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
