///Generic synthetic humanoids. Usable as either synths, or as a basetype in code for other robotic species
/datum/species/synthetic
	name = "Synthetic Humanoid"
	id = SPECIES_SYNTHETIC
	species_traits = list(NO_DNA_COPY, NOTRANSSTING, EYECOLOR, HAIR, FACEHAIR, LIPS, HAS_FLESH, HAS_BONE)
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_NOMETABOLISM,
		TRAIT_NOHUNGER,
		TRAIT_CAN_STRIP,
		TRAIT_TOXIMMUNE,
		TRAIT_NOBREATH,
		TRAIT_GENELESS,
		TRAIT_NOCLONELOSS,
		TRAIT_CAN_USE_FLIGHT_POTION,
	) //Synths metabolization and hunger is handled by prefs
	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID
	use_skintones = 1
	meat = null
	brutemod = 1.5
	burnmod = 1.5
	damage_overlay_type = "synth"
	payday_modifier = 0.6 //People are afraid of synths, and the revenue service KNOWS ALL
	mutant_bodyparts = list("wings" = "None")
	mutantappendix = null //Sorry, no appendix for synths
	species_language_holder = /datum/language_holder/synth
	wings_icons = list("Robotic")
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	examine_limb_id = SPECIES_HUMAN
	///The initial name of the species, before prefs change it.
	var/initial_species_name = "Synthetic Humanoid"

/datum/species/synthetic/get_species_description()
	return "A synthetic humanoid, possibly hiding it's status from the organics around it." //Placeholder description until lore rewrites on species

/datum/species/synthetic/get_species_lore()
	return list(
		"Synths are created from pretty much anywhere for any reason. It's up to you to decide their lore.",
	) //Placeholder until lore rewrites on species
