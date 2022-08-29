/mob/living/simple_animal/hostile/simple_human/pirate
	name = "Pirate"
	desc = "Does what he wants cause a pirate is free."
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	sentience_type = SENTIENCE_HUMANOID
	response_help_continuous = "pushes"
	response_help_simple = "push"
	speed = 0
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/weapons/punch1.ogg'
	combat_mode = TRUE
	speak_emote = list("yarrs")
	loot = list(/obj/effect/mob_spawn/corpse/human/pirate)
	del_on_death = 1
	faction = list("pirate")
	footstep_type = FOOTSTEP_MOB_SHOE
	outfit = /datum/outfit/piratecorpse


/mob/living/simple_animal/hostile/simple_human/pirate/melee
	name = "Pirate Swashbuckler"
	melee_damage_lower = 30
	melee_damage_upper = 30
	armour_penetration = 35
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/blade1.ogg'
	attack_vis_effect = ATTACK_EFFECT_SLASH
	loot = list(/obj/effect/mob_spawn/corpse/human/pirate/melee)
	light_range = 2
	light_power = 2.5
	light_color = COLOR_SOFT_RED
	outfit = /datum/outfit/piratecorpse/melee

/mob/living/simple_animal/hostile/simple_human/pirate/melee/space
	name = "Space Pirate Swashbuckler"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speed = 1
	loot = list(/obj/effect/mob_spawn/corpse/human/pirate/space)
	outfit = /datum/outfit/piratecorpse/space

/mob/living/simple_animal/hostile/simple_human/pirate/melee/space/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)

/mob/living/simple_animal/hostile/simple_human/pirate/ranged
	name = "Pirate Gunner"
	projectilesound = 'sound/weapons/laser.ogg'
	ranged = 1
	rapid = 2
	rapid_fire_delay = 6
	retreat_distance = 5
	minimum_distance = 5
	projectiletype = /obj/projectile/beam/laser
	loot = list(/obj/effect/mob_spawn/corpse/human/pirate/ranged)
	outfit = /datum/outfit/piratecorpse/ranged

/mob/living/simple_animal/hostile/simple_human/pirate/ranged/space
	name = "Space Pirate Gunner"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speed = 1
	loot = list(/obj/effect/mob_spawn/corpse/human/pirate/space/ranged)
	outfit = /datum/outfit/piratecorpse/space/ranged

/mob/living/simple_animal/hostile/simple_human/pirate/ranged/space/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)
