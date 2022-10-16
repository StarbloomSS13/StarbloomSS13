/obj/item/ammo_box/magazine/m10mm/rifle
	name = "rifle magazine (10mm)"
	desc = "A well-worn magazine fitted for the surplus rifle."
	icon_state = "75-8"
	base_icon_state = "75"
	ammo_type = /obj/item/ammo_casing/c10mm
	max_ammo = 10

/obj/item/ammo_box/magazine/m10mm/rifle/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[ammo_count() ? "8" : "0"]"

/obj/item/ammo_box/magazine/m556
	name = "toploader magazine (5.56mm FMJ)"
	icon_state = "5.56m"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = CALIBER_A556
	max_ammo = 30
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/ammo_box/magazine/m556/ap
	name = "toploader magazine (5.56mm AP)"
	icon_state = "5.56m"
	ammo_type = /obj/item/ammo_casing/a556/ap
	caliber = CALIBER_A556
	max_ammo = 30
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/ammo_box/magazine/m556/hp
	name = "toploader magazine (5.56mm HP)"
	icon_state = "5.56m"
	ammo_type = /obj/item/ammo_casing/a556/hp
	caliber = CALIBER_A556
	max_ammo = 30
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/ammo_box/magazine/m556/i
	name = "toploader magazine (5.56mm Incendiary)"
	icon_state = "5.56m"
	ammo_type = /obj/item/ammo_casing/a556/i
	caliber = CALIBER_A556
	max_ammo = 30
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/ammo_box/magazine/m556/phasic
	name = "toploader magazine (5.56mm Phasic)"
	ammo_type = /obj/item/ammo_casing/a556/phasic


/obj/item/ammo_box/magazine/lr_22
	name = "22. LR magazine"
	desc = "a small magazine for light carbines"
	icon_state = "levermag_10"
	base_icon_state = "levermag_0"
	caliber = CALIBER_22
	ammo_type = /obj/item/ammo_casing/lr_22
	max_ammo = 10
	start_empty = FALSE
	multiload = TRUE
	multiple_sprites = AMMO_BOX_FULL_EMPTY



