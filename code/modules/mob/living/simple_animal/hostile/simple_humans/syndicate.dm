/*
	CONTENTS
	LINE 10  - BASE MOB
	LINE 52  - SWORD AND SHIELD
	LINE 164 - GUNS
	LINE 267 - MISC
*/


///////////////Base mob////////////
/mob/living/simple_animal/hostile/simple_human/syndicate
	name = "Syndicate Operative"
	desc = "Death to Nanotrasen."
	outfit = /datum/outfit/syndicatesoldiercorpse
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	sentience_type = SENTIENCE_HUMANOID
	speed = 0
	stat_attack = HARD_CRIT
	robust_searching = 1
	melee_damage_lower = 10
	melee_damage_upper = 10
	loot = list(/obj/effect/mob_spawn/corpse/human/syndicatesoldier)
	faction = list(ROLE_SYNDICATE)
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 1
	dodging = TRUE
	rapid_melee = 2
	footstep_type = FOOTSTEP_MOB_SHOE

///////////////Melee////////////

/mob/living/simple_animal/hostile/simple_human/syndicate/space
	name = "Syndicate Commando"
	outfit = /datum/outfit/syndicatecommandocorpse
	maxHealth = 170
	health = 170
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speed = 1
	light_range = 4

/mob/living/simple_animal/hostile/simple_human/syndicate/space/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)

/mob/living/simple_animal/hostile/simple_human/syndicate/space/stormtrooper
	outfit = /datum/outfit/syndicatestormtroopercorpse
	name = "Syndicate Stormtrooper"
	maxHealth = 250
	health = 250

/mob/living/simple_animal/hostile/simple_human/syndicate/melee //dude with a knife and no shields
	melee_damage_lower = 15
	melee_damage_upper = 15
	held_item = /obj/item/knife/combat/survival
	held_item_left = /obj/item/shield/energy
	loot = list(/obj/effect/gibspawner/human)
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	attack_vis_effect = ATTACK_EFFECT_SLASH
	status_flags = 0
	var/projectile_deflect_chance = 0

/mob/living/simple_animal/hostile/simple_human/syndicate/melee/space
	outfit = /datum/outfit/syndicatecommandocorpse
	name = "Syndicate Commando"
	maxHealth = 170
	health = 170
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speed = 1
	projectile_deflect_chance = 50
	light_range = 4

/mob/living/simple_animal/hostile/simple_human/syndicate/melee/space/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)

/mob/living/simple_animal/hostile/simple_human/syndicate/melee/space/stormtrooper
	outfit = /datum/outfit/syndicatestormtroopercorpse
	name = "Syndicate Stormtrooper"
	maxHealth = 250
	health = 250
	projectile_deflect_chance = 50

/mob/living/simple_animal/hostile/simple_human/syndicate/melee/sword
	melee_damage_lower = 30
	melee_damage_upper = 30
	held_item = /obj/item/melee/energy/sword/saber
	attack_sound = 'sound/weapons/blade1.ogg'
	armour_penetration = 35
	light_color = COLOR_SOFT_RED
	status_flags = 0
	light_range = 2
	light_power = 2.5
	light_color = COLOR_SOFT_RED
	projectile_deflect_chance = 50

/mob/living/simple_animal/hostile/simple_human/syndicate/melee/bullet_act(obj/projectile/Proj)
	if(prob(projectile_deflect_chance))
		visible_message(span_danger("[src] blocks [Proj] with its shield!"))
		return BULLET_ACT_BLOCK
	return ..()

/mob/living/simple_animal/hostile/simple_human/syndicate/melee/sword/space
	outfit = /datum/outfit/syndicatecommandocorpse
	name = "Syndicate Commando"
	maxHealth = 170
	health = 170
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speed = 1
	projectile_deflect_chance = 50
	light_range = 4

/mob/living/simple_animal/hostile/simple_human/syndicate/melee/sword/space/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)

/mob/living/simple_animal/hostile/simple_human/syndicate/melee/sword/space/stormtrooper
	outfit = /datum/outfit/syndicatestormtroopercorpse
	name = "Syndicate Stormtrooper"
	maxHealth = 250
	health = 250
	projectile_deflect_chance = 50

///////////////Guns////////////

/mob/living/simple_animal/hostile/simple_human/syndicate/ranged
	ranged = 1
	retreat_distance = 5
	minimum_distance = 5
	held_item = /obj/item/gun/ballistic/automatic/pistol
	casingtype = /obj/item/ammo_casing/c9mm
	projectilesound = 'sound/weapons/gun/pistol/shot.ogg'
	loot = list(/obj/effect/gibspawner/human)
	dodging = FALSE
	rapid_melee = 1

/mob/living/simple_animal/hostile/simple_human/syndicate/ranged/infiltrator //shuttle loan event
	projectilesound = 'sound/weapons/gun/smg/shot_suppressed.ogg'
	loot = list(/obj/effect/mob_spawn/corpse/human/syndicatesoldier)

/mob/living/simple_animal/hostile/simple_human/syndicate/ranged/space
	outfit = /datum/outfit/syndicatecommandocorpse
	name = "Syndicate Commando"
	maxHealth = 170
	health = 170
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speed = 1
	light_range = 4

/mob/living/simple_animal/hostile/simple_human/syndicate/ranged/space/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)

/mob/living/simple_animal/hostile/simple_human/syndicate/ranged/space/stormtrooper
	outfit = /datum/outfit/syndicatestormtroopercorpse
	name = "Syndicate Stormtrooper"
	maxHealth = 250
	health = 250

/mob/living/simple_animal/hostile/simple_human/syndicate/ranged/smg
	rapid = 2
	held_item = /obj/item/gun/ballistic/automatic/c20r // DO YOU KNOW THE NAME OF SPACE GOD?
	casingtype = /obj/item/ammo_casing/c45
	projectilesound = 'sound/weapons/gun/smg/shot.ogg'

/mob/living/simple_animal/hostile/simple_human/syndicate/ranged/smg/pilot //caravan ambush ruin
	name = "Syndicate Salvage Pilot"
	loot = list(/obj/effect/mob_spawn/corpse/human/syndicatesoldier)

/mob/living/simple_animal/hostile/simple_human/syndicate/ranged/smg/space
	outfit = /datum/outfit/syndicatecommandocorpse
	name = "Syndicate Commando"
	maxHealth = 170
	health = 170
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speed = 1
	light_range = 4

/mob/living/simple_animal/hostile/simple_human/syndicate/ranged/smg/space/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)

/mob/living/simple_animal/hostile/simple_human/syndicate/ranged/smg/space/stormtrooper
	outfit = /datum/outfit/syndicatestormtroopercorpse
	name = "Syndicate Stormtrooper"
	maxHealth = 250
	health = 250

/mob/living/simple_animal/hostile/simple_human/syndicate/ranged/shotgun
	rapid = 2
	rapid_fire_delay = 6
	minimum_distance = 3
	held_item = /obj/item/gun/ballistic/shotgun/bulldog
	casingtype = /obj/item/ammo_casing/shotgun/buckshot //buckshot (up to 72.5 brute) fired in a two-round burst

/mob/living/simple_animal/hostile/simple_human/syndicate/ranged/shotgun/space
	outfit = /datum/outfit/syndicatecommandocorpse
	name = "Syndicate Commando"
	maxHealth = 170
	health = 170
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speed = 1
	light_range = 4

/mob/living/simple_animal/hostile/simple_human/syndicate/ranged/shotgun/space/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)

/mob/living/simple_animal/hostile/simple_human/syndicate/ranged/shotgun/space/stormtrooper
	outfit = /datum/outfit/syndicatestormtroopercorpse
	name = "Syndicate Stormtrooper"
	maxHealth = 250
	health = 250

///////////////Misc////////////

/mob/living/simple_animal/hostile/simple_human/syndicate/civilian
	minimum_distance = 10
	retreat_distance = 10
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE

/mob/living/simple_animal/hostile/simple_human/syndicate/civilian/Aggro()
	..()
	summon_backup(15)
	say("GUARDS!!")


/mob/living/simple_animal/hostile/viscerator
	name = "viscerator"
	desc = "A small, twin-bladed machine capable of inflicting very deadly lacerations."
	icon_state = "viscerator_attack"
	icon_living = "viscerator_attack"
	pass_flags = PASSTABLE | PASSMOB
	combat_mode = TRUE
	mob_biotypes = MOB_ROBOTIC
	health = 25
	maxHealth = 25
	melee_damage_lower = 15
	melee_damage_upper = 15
	wound_bonus = -10
	bare_wound_bonus = 20
	sharpness = SHARP_EDGED
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	attack_verb_continuous = "cuts"
	attack_verb_simple = "cut"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	attack_vis_effect = ATTACK_EFFECT_SLASH
	faction = list(ROLE_SYNDICATE)
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	mob_size = MOB_SIZE_TINY
	limb_destroyer = 1
	speak_emote = list("states")
	bubble_icon = "syndibot"
	gold_core_spawnable = HOSTILE_SPAWN
	del_on_death = 1
	deathmessage = "is smashed into pieces!"

/mob/living/simple_animal/hostile/viscerator/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/simple_flying)
	AddComponent(/datum/component/swarming)
