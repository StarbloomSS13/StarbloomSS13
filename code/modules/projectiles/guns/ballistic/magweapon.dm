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

///Royal Railgun//

/obj/item/gun/ballistic/rifle/railgun/royal_mosin
	name = "\improper Royal Mosin Nagant"
	desc = "A converted mosin nagant for the royal guard. It has been converted to a coilgun and is able to fire railgun slugs. Despite the loose wire, the craftsmanship is incredible."
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	internal_magazine = TRUE
	mag_type = /obj/item/ammo_box/magazine/internal/railgun
	fire_sound = 'sound/weapons/gun/railgun/railgun.ogg'
	can_suppress = FALSE
	burst_size = 1
	actions_types = null
	fire_delay = 0
	spread = 0
	recoil = 0
	empty_indicator = FALSE
	casing_ejector = FALSE
	mag_display = FALSE
	icon = 'starbloom_modules/aesthetics/guns/icons/guns.dmi'
	icon_state = "royal_mosin"
	can_bayonet = TRUE
	knife_x_offset = 27
	knife_y_offset = 12
	show_bolt_icon = FALSE
