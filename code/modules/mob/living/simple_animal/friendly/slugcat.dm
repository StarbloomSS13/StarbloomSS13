/mob/living/simple_animal/pet/slugcat
	name = "slugcat"
	desc = "A strange, yet adorable white creature. Its body is exceptionally flexible."
	icon = 'icons/mob/pets.dmi'
	icon_state = "catslug"
	icon_living = "catslug"
	icon_dead = "catslug_dead"
	held_state = "slugcat"
	speak_emote = list("purrs", "meows", "blorbles")
	emote_hear = list("meows.", "mews.", "blorbles")
	emote_see = list("shakes its head.", "shivers.", "squishes")
	speak_chance = 1
	turns_per_move = 5
	can_be_held = TRUE
	see_in_dark = 6
	pass_flags = PASSTABLE
	mob_size = MOB_SIZE_SMALL
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	minbodytemp = 200
	maxbodytemp = 400
	unsuitable_atmos_damage = 0.5
	animal_species = /mob/living/simple_animal/pet/slugcat
	childtype = list(/mob/living/simple_animal/pet/slugcat = 1)
	butcher_results = list(/obj/item/food/meat/slab = 1, /obj/item/organ/ears/cat = 1, /obj/item/organ/tail/cat = 1, /obj/item/stack/sheet/animalhide/cat = 1)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	mobility_flags = MOBILITY_FLAGS_REST_CAPABLE_DEFAULT
	var/mob/living/simple_animal/mouse/movement_target
	gold_core_spawnable = FRIENDLY_SPAWN
	collar_type = "cat"
	attack_verb_continuous = "squishes"
	attack_verb_simple = "squish"
	attack_sound = 'sound/effects/attackblob.ogg'
	attack_vis_effect = ATTACK_EFFECT_CLAW

	footstep_type = FOOTSTEP_MOB_CLAW

/mob/living/simple_animal/pet/slugcat/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/pet_bonus, "purrs!")
	add_verb(src, /mob/living/proc/toggle_resting)
	add_cell_sample()
	ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)

/mob/living/simple_animal/pet/slugcat/add_cell_sample()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_CAT, CELL_VIRUS_TABLE_GENERIC_MOB, 1, 5)
