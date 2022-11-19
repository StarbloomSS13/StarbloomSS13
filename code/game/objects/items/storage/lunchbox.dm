/obj/item/storage/lunchbox
	name = "lunchbox"
	icon_state = "lunchbox"
	desc = "It's fucked, yell at coders."
	inhand_icon_state = "lunchbox"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	drop_sound = 'sound/items/handling/cardboardbox_drop.ogg'
	pickup_sound =  'sound/items/handling/cardboardbox_pickup.ogg'
	throw_speed = 3
	throw_range = 7

/obj/item/storage/lunchbox/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.use_sound = 'sound/items/storage/briefcase.ogg'
	STR.set_holdable(list(
		/obj/item/food,
		/obj/item/reagent_containers/food/drinks
		))

/obj/item/storage/lunchbox/unity
	name = "unity lunchbox"
	icon_state = "lunchbox_unity"
	desc = "A refined blue lunchbox to show your support for everyone's favourite aristocratic tyrants."

/obj/item/storage/lunchbox/homeguard
	name = "home guard lunchbox"
	icon_state = "lunchbox_homeguard"
	inhand_icon_state = "lunchbox_homeguard"
	desc = "A tacticool green lunchbox to show your support for everyone's favourite citizen's militia."

/obj/item/storage/lunchbox/slugcat
	name = "slugcat lunchbox"
	icon_state = "lunchbox_slugcat"
	desc = "An adorable lunchbox with a slugcat printed on it."

/obj/item/storage/lunchbox/corgi
	name = "corgi lunchbox"
	icon_state = "lunchbox_corgi"
	desc = "An adorable lunchbox with a corgi printed on it."

/obj/item/storage/lunchbox/amongus
	name = "suspicious lunchbox"
	icon_state = "lunchbox_suspicious"
	inhand_icon_state = "lunchbox_suspicious"
	desc = "A plain red lunchbox... right?"
