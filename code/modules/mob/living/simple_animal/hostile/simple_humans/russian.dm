/mob/living/simple_animal/hostile/simple_human/russian
	name = "Russian"
	desc = "For the Motherland!"
	outfit = /datum/outfit/russiancorpse
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	sentience_type = SENTIENCE_HUMANOID
	speed = 0
	loot = list(/obj/effect/mob_spawn/corpse/human/russian)
	faction = list("russian")
	status_flags = CANPUSH

	footstep_type = FOOTSTEP_MOB_SHOE


/mob/living/simple_animal/hostile/simple_human/russian/ranged
	outfit = /datum/outfit/russiancorpse/ranged
	loot = list(/obj/effect/mob_spawn/corpse/human/russian/ranged)
	ranged = 1
	retreat_distance = 5
	minimum_distance = 5
	projectilesound = 'sound/weapons/gun/revolver/shot.ogg'
	casingtype = /obj/item/ammo_casing/n762


/mob/living/simple_animal/hostile/simple_human/russian/ranged/mosin
	loot = list(/obj/effect/mob_spawn/corpse/human/russian/ranged)
	casingtype = /obj/item/ammo_casing/a762
	outfit = /datum/outfit/russiancorpse/ranged/mosin

/mob/living/simple_animal/hostile/simple_human/russian/ranged/trooper
	name = "Russian Trooper"
	outfit = /datum/outfit/russiancorpse/ranged/trooper
	maxHealth = 150
	health = 150
	casingtype = /obj/item/ammo_casing/shotgun/buckshot
	loot = list(/obj/effect/mob_spawn/corpse/human/russian/ranged/trooper)

/mob/living/simple_animal/hostile/simple_human/russian/ranged/officer
	name = "Russian Officer"
	outfit = /datum/outfit/russiancorpse/officer
	maxHealth = 65
	health = 65
	rapid = 3
	casingtype = /obj/item/ammo_casing/c9mm
	loot = list(/obj/effect/mob_spawn/corpse/human/russian/ranged/officer)

/mob/living/simple_animal/hostile/simple_human/russian/ranged/officer/Aggro()
	..()
	summon_backup(15)
	say("V BOJ!!")
