//If you're looking for spawners like ash walker eggs, check ghost_role_spawners.dm

///Wizard tower item
/obj/item/disk/design_disk/adv/knight_gear
	name = "Magic Disk of Smithing"

/obj/item/disk/design_disk/adv/knight_gear/Initialize(mapload)
	. = ..()
	var/datum/design/knight_armour/A = new
	var/datum/design/knight_helmet/H = new
	blueprints[1] = A
	blueprints[2] = H
