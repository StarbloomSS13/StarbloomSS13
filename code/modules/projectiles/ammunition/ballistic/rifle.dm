//Starbloom ammo types begin
//TG ammo is below

//Memoria ammo begin
/obj/item/ammo_casing/a762
	name = "7.62 FMJ bullet casing"
	desc = "A 7.62 bullet casing."
	icon_state = "762-casing"
	caliber = CALIBER_A762
	projectile_type = /obj/projectile/bullet/a762

/obj/item/ammo_casing/a762/ap
	name = "7.62 AP bullet casing"
	icon_state = "762ap-casing"
	desc = "A 7.62 bullet casing. Contains armour-piercing rounds."
	projectile_type = /obj/projectile/bullet/a762/ap

/obj/item/ammo_casing/a762/hp
	name = "7.62 HP bullet casing"
	icon_state = "762hp-casing"
	desc = "A 7.62 bullet casing. Contains hollowpoint rounds."
	projectile_type = /obj/projectile/bullet/a762/hp

/obj/item/ammo_casing/a762/i
	name = "7.62 Incendiary bullet casing"
	icon_state = "762i-casing"
	desc = "A 7.62 bullet casing. Contains incendiary rounds."
	projectile_type = /obj/projectile/bullet/a762/i

/obj/item/ammo_casing/a762/rad
	name = "7.62 Radioactive bullet casing"
	icon_state = "762rad-casing"
	desc = "A 7.62mm bullet casing, stamped with a small amount of a radioactive isotope. Contains radioactive rounds."
	projectile_type = /obj/projectile/bullet/a762/rad

/obj/item/ammo_casing/a762/enchanted
	projectile_type = /obj/projectile/bullet/a762/enchanted
//Memoria ammo end

//Valiant ammo start
/obj/item/ammo_casing/a556
	name = "5.56mm FMJ bullet casing"
	icon_state = "556-casing"
	desc = "A 5.56mm bullet casing."
	caliber = CALIBER_A556
	projectile_type = /obj/projectile/bullet/a556

/obj/item/ammo_casing/a556/ap
	name = "5.56mm AP bullet casing"
	icon_state = "556ap-casing"
	desc = "A 5.56mm bullet casing. Contains armour-piercing rounds."
	projectile_type = /obj/projectile/bullet/a556/ap

/obj/item/ammo_casing/a556/hp
	name = "5.56mm HP bullet casing"
	icon_state = "556hp-casing"
	desc = "A 5.56mm bullet casing. Contains hollowpoint rounds."
	projectile_type = /obj/projectile/bullet/a556/hp

/obj/item/ammo_casing/a556/i
	name = "5.56mm Incendiary bullet casing"
	icon_state = "556i-casing"
	desc = "A 5.56mm bullet casing. Contains incendiary rounds."
	projectile_type = /obj/projectile/bullet/a556/i

/obj/item/ammo_casing/a556/rad
	name = "5.56mm Radioactive bullet casing"
	icon_state = "556rad-casing"
	desc = "A 5.56mm bullet casing, stamped with a small amount of a radioactive isotope. Contains radioactive rounds."
	projectile_type = /obj/projectile/bullet/a556/rad
//Valiant ammo end
//Starbloom ammo end

//Begin TG ammo
//Unused in Starbloom
/obj/item/ammo_casing/a556/phasic
	name = "5.56mm phasic bullet casing"
	desc = "A 5.56mm phasic bullet casing."
	projectile_type = /obj/projectile/bullet/a556/phasic

/obj/item/ammo_casing/a40mm
	name = "40mm HE shell"
	desc = "A cased high explosive grenade that can only be activated once fired out of a grenade launcher."
	caliber = CALIBER_40MM
	icon_state = "40mmHE"
	projectile_type = /obj/projectile/bullet/a40mm
