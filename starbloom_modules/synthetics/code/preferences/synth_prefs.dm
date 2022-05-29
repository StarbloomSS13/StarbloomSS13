//Do we hide our identity to that of a human?
/datum/preference/toggle/hide_synth_identity
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "hide_synth_identity"
	priority = PREFERENCE_PRIORITY_NAME_MODIFICATIONS
	default_value = FALSE

/datum/preference/toggle/hide_synth_identity/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	if(!issynthetic(target))
		return

	if(value)
		target.dna.species.name = "Human"
	else
		var/datum/species/synthetic/our_species = target.dna.species
		our_species.name = our_species.initial_species_name

/datum/preference/toggle/hide_synth_identity/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return ispath(preferences.read_preference(/datum/preference/choiced/species), /datum/species/synthetic)

//Can we metabolize chemicals?
/datum/preference/toggle/synth_can_metabolize
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "synth_can_metabolize"
	priority = PREFERENCE_PRIORITY_NAME_MODIFICATIONS
	default_value = FALSE

/datum/preference/toggle/synth_can_metabolize/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	if(!issynthetic(target))
		return

	if(value)
		target.dna.species.inherent_traits -= TRAIT_NOMETABOLISM
		target.status_traits -= TRAIT_NOMETABOLISM

/datum/preference/toggle/synth_can_metabolize/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return ispath(preferences.read_preference(/datum/preference/choiced/species), /datum/species/synthetic)

//Can we become hungry?
/datum/preference/toggle/synth_hunger
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "synth_hunger"
	priority = PREFERENCE_PRIORITY_NAME_MODIFICATIONS
	default_value = FALSE

/datum/preference/toggle/synth_hunger/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	if(!issynthetic(target))
		return

	if(value)
		target.dna.species.inherent_traits -= TRAIT_NOHUNGER
		target.status_traits -= TRAIT_NOHUNGER

/datum/preference/toggle/synth_hunger/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return preferences.read_preference(/datum/preference/toggle/synth_can_metabolize)
