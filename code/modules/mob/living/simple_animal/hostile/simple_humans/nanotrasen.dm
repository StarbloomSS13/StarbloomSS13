/mob/living/simple_animal/hostile/simple_human/nanotrasen
	name = "\improper Nanotrasen Private Security Officer"
	desc = "An officer part of Nanotrasen's private security force, he seems rather unpleased to meet you."
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	sentience_type = SENTIENCE_HUMANOID
	speed = 0
	stat_attack = HARD_CRIT
	robust_searching = 1
	melee_damage_lower = 10
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/weapons/punch1.ogg'
	combat_mode = TRUE
	loot = list(/obj/effect/mob_spawn/corpse/human/nanotrasensoldier)
	faction = list(ROLE_DEATHSQUAD)
	check_friendly_fire = TRUE
	status_flags = CANPUSH
	del_on_death = TRUE
	dodging = TRUE
	footstep_type = FOOTSTEP_MOB_SHOE
	outfit = /datum/outfit/nanotrasensoldiercorpse2

/mob/living/simple_animal/hostile/simple_human/nanotrasen/screaming/Aggro()
	..()
	summon_backup(15)
	say("411 in progress, requesting backup!")


/mob/living/simple_animal/hostile/simple_human/nanotrasen/ranged
	ranged = 1
	retreat_distance = 3
	minimum_distance = 5
	casingtype = /obj/item/ammo_casing/c45
	projectilesound = 'sound/weapons/gun/pistol/shot_alt.ogg'
	held_item = /obj/item/gun/ballistic/automatic/pistol


/mob/living/simple_animal/hostile/simple_human/nanotrasen/ranged/smg
	rapid = 3
	casingtype = /obj/item/ammo_casing/c46x30mm
	projectilesound = 'sound/weapons/gun/smg/shot.ogg'
	held_item = /obj/item/gun/ballistic/automatic/proto
