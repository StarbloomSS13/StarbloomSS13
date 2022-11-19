// 5.56mm (M-90gl Carbine)

/obj/projectile/bullet/a556
	name = "5.56mm bullet"
	damage = 20

/obj/projectile/bullet/a556/ap
	name = "5.56mm armour-piercing bullet"
	damage = 15
	armour_penetration = 50
	wound_bonus = -30

/obj/projectile/bullet/a556/hp
	name = "5.56mm hollowpoint bullet"
	damage = 20
	weak_against_armour = FALSE
	armour_penetration = -30
	wound_bonus = 30

/obj/projectile/bullet/a556/i
	name = "5.56mm incendiary bullet"
	damage = 10
	weak_against_armour = TRUE

/obj/projectile/bullet/a556/i/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(6)
		M.IgniteMob()

/obj/projectile/bullet/a556/rad
	name = "5.56mm radioactive bullet"
	damage = 10
	weak_against_armour = TRUE

/obj/projectile/bullet/a556/rad/on_hit(atom/target, blocked = FALSE)
	radiation_pulse(target, max_range = 0, threshold = 0, chance = 100)

/obj/projectile/bullet/a556/phasic
	name = "5.56mm phasic bullet"
	icon_state = "gaussphase"
	damage = 20
	armour_penetration = 100
	projectile_phasing =  PASSTABLE | PASSGLASS | PASSGRILLE | PASSCLOSEDTURF | PASSMACHINE | PASSSTRUCTURE | PASSDOORS

// 7.62 (Nagant Rifle)

/obj/projectile/bullet/a762
	name = "7.62 bullet"
	damage = 50

/obj/projectile/bullet/a762/ap
	name = "7.62 armour-piercing bullet"
	damage = 50
	armour_penetration = 50
	wound_bonus = -30

/obj/projectile/bullet/a762/hp
	name = "7.62 hollowpoint bullet"
	damage = 60
	weak_against_armour = FALSE
	armour_penetration = -50
	wound_bonus = 30

/obj/projectile/bullet/a762/i
	name = "7.62 incendiary bullet"
	damage = 40
	weak_against_armour = TRUE

/obj/projectile/bullet/a762/i/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(6)
		M.IgniteMob()

/obj/projectile/bullet/a762/rad
	name = "7.62 radioactive bullet"
	damage = 40
	weak_against_armour = TRUE

/obj/projectile/bullet/a762/rad/on_hit(atom/target, blocked = FALSE)
	radiation_pulse(target, max_range = 0, threshold = 0, chance = 100)

/obj/projectile/bullet/a762/enchanted
	name = "enchanted 7.62 bullet"
	damage = 20
	stamina = 80

// Harpoons (Harpoon Gun)

/obj/projectile/bullet/harpoon
	name = "harpoon"
	icon_state = "gauss"
	damage = 60
	armour_penetration = 50
	wound_bonus = -20
	bare_wound_bonus = 80
	embedding = list(embed_chance=100, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)
	wound_falloff_tile = -5

/obj/projectile/bullet/harpoon/crystal
	name = "crystal harpoon"
	icon_state = "crystalharpoon"
	damage = 50
	armour_penetration = 100
	wound_bonus = -20
	embedding = list(embed_chance=100, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)
	wound_falloff_tile = -5

// Magrifles
/obj/projectile/bullet/magnetic
	name = "magnetic slug"
	icon_state = "mag"
	damage = 30
	armour_penetration = 50
	wound_bonus = -30
