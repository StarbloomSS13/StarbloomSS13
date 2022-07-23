/obj/item/gun/ballistic/automatic/magrifle
	name = "magnetic rifle"
	desc = "An advanced magnetic rifle developed by the Last Edict capable of firing a projectile at extreme speed."
	icon_state = "magrifle"
	force = 10
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/mmag
	fire_sound = 'sound/weapons/magrifle.ogg'
	can_suppress = FALSE
	burst_size = 1
	actions_types = null
	fire_delay = 0
	spread = 0
	recoil = 0
	casing_ejector = FALSE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	mag_display = FALSE

///magpistol///

/obj/item/gun/ballistic/automatic/magrifle/pistol
	name = "magpistol"
	desc = "An advanced magnetic handgun developed by the Last Edict capable of firing a projectile at extreme speed."
	icon_state = "magpistol"
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	mag_display = FALSE
	fire_sound = 'sound/weapons/magpistol.ogg'
	mag_type = /obj/item/ammo_box/magazine/mmag/small
	fire_delay = 2

/obj/item/gun/ballistic/automatic/magrifle/pistol/update_overlays()
	. = ..()
	if(magazine)
		. += "magpistol-magazine"
