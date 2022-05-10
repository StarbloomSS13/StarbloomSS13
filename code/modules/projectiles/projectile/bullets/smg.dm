// .45 (M1911 & C20r)

/obj/projectile/bullet/c45
	name = ".45 rubber bullet"
	damage = 10
	stamina = 30
	weak_against_armour = TRUE

/obj/projectile/bullet/c45/ap
	name = ".45 armor-piercing bullet"
	damage = 25
	armour_penetration = 50
	wound_bonus = -30

/obj/projectile/bullet/c45/hp
	name = ".45 hollowpoint bullet"
	damage = 40
	armour_penetration = -50
	wound_bonus = 30

/obj/projectile/bullet/c45/i
	name = ".45 incendiary bullet"
	damage = 25
	armour_penetration = -50

/obj/projectile/bullet/c45/i/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(6)
		M.IgniteMob()

/obj/projectile/bullet/c45/fmj
	name = ".45 FMJ bullet"
	damage = 30
	wound_bonus = -10
	wound_falloff_tile = -10

/obj/projectile/bullet/incendiary/c45
	name = ".45 incendiary bullet"
	damage = 15
	fire_stacks = 2

// 4.6x30mm (Autorifles)

/obj/projectile/bullet/c46x30mm
	name = "4.6x30mm bullet"
	damage = 20
	wound_bonus = -5
	bare_wound_bonus = 5
	embed_falloff_tile = -4

/obj/projectile/bullet/c46x30mm/ap
	name = "4.6x30mm armor-piercing bullet"
	damage = 15
	armour_penetration = 40
	embedding = null

/obj/projectile/bullet/incendiary/c46x30mm
	name = "4.6x30mm incendiary bullet"
	damage = 10
	fire_stacks = 1
