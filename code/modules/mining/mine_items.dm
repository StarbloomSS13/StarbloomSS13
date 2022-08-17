/**********************Light************************/

//this item is intended to give the effect of entering the mine, so that light gradually fades. we also use the base effect for certain lighting effects while mapping.
/obj/effect/light_emitter
	name = "light emitter"
	icon_state = "lighting_marker"
	anchored = TRUE
	invisibility = INVISIBILITY_ABSTRACT
	var/set_luminosity = 8
	var/set_cap = 0

/obj/effect/light_emitter/Initialize(mapload)
	. = ..()
	set_light(set_luminosity, set_cap)

/obj/effect/light_emitter/singularity_pull()
	return

/obj/effect/light_emitter/singularity_act()
	return

/**********************Salvage Crew Lockers**************************/

/obj/structure/closet/wardrobe/salvagecrew
	name = "salvage wardrobe"
	icon_door = "mixed"

/obj/structure/closet/wardrobe/salvagecrew/PopulateContents()
	new /obj/item/storage/backpack/duffelbag(src)
	new /obj/item/storage/backpack/explorer(src)
	new /obj/item/storage/backpack/satchel/explorer(src)
	new /obj/item/clothing/under/rank/cargo/salvagecrew/explorer(src)
	new /obj/item/clothing/under/rank/cargo/salvagecrew/explorer(src)
	new /obj/item/clothing/under/rank/cargo/salvagecrew/explorer(src)
	new /obj/item/clothing/shoes/workboots/salvage(src)
	new /obj/item/clothing/shoes/workboots/salvage(src)
	new /obj/item/clothing/shoes/workboots/salvage(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/clothing/suit/hooded/wintercoat/salvage(src)
	new /obj/item/clothing/suit/hooded/wintercoat/salvage(src)
	new /obj/item/clothing/suit/hooded/wintercoat/salvage(src)

/obj/structure/closet/secure_closet/salvagecrew
	name = "salvage crew equipment"
	icon_state = "salvage"
	req_access = list(ACCESS_SALVAGECREW)

/obj/structure/closet/secure_closet/salvagecrew/unlocked
	locked = FALSE

/obj/structure/closet/secure_closet/salvagecrew/PopulateContents()
	..()
	new /obj/item/stack/sheet/mineral/sandbags(src, 5)
	new /obj/item/storage/box/emptysandbags(src)
	new /obj/item/shovel(src)
	new /obj/item/pickaxe/mini(src)
	new /obj/item/radio/headset/headset_cargo/salvagecrew(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/storage/bag/plants(src)
	new /obj/item/storage/bag/ore(src)
	new /obj/item/t_scanner/adv_mining_scanner/lesser(src)
	new /obj/item/gun/energy/plasmacutter(src)
	new /obj/item/survivalcapsule(src)
	new /obj/item/mod/paint(src)
	new /obj/item/assault_pod/auxbase(src)


/**********************Shuttle Computer**************************/

/obj/machinery/computer/shuttle/salvage
	name = "salvage shuttle console"
	desc = "Used to call and send the salvage shuttle."
	circuit = /obj/item/circuitboard/computer/salvage_shuttle
	shuttleId = "mining" // Unchanged because it'd be a nightmare
	possible_destinations = "mining_home;mining_away;landing_zone_dock;mining_public" // Ditto
	no_destination_swap = TRUE
	var/static/list/dumb_rev_heads = list()

//ATTACK HAND IGNORING PARENT RETURN VALUE
/obj/machinery/computer/shuttle/salvage/attack_hand(mob/user, list/modifiers)
	if(is_station_level(user.z) && user.mind && IS_HEAD_REVOLUTIONARY(user) && !(user.mind in dumb_rev_heads))
		to_chat(user, span_warning("You get a feeling that leaving the station might be a REALLY dumb idea..."))
		dumb_rev_heads += user.mind
		return

	if (HAS_TRAIT(user, TRAIT_FORBID_MINING_SHUTTLE_CONSOLE_OUTSIDE_STATION) && !is_station_level(user.z))
		to_chat(user, span_warning("You get the feeling you shouldn't mess with this."))
		return

	return ..()

/obj/machinery/computer/shuttle/salvage/common // TODO: Send this and related code to the shadow realm
	name = "lavaland shuttle console"
	desc = "Used to call and send the lavaland shuttle."
	circuit = /obj/item/circuitboard/computer/salvage_shuttle/common
	shuttleId = "mining_common"
	possible_destinations = "commonmining_home;lavaland_common_away;landing_zone_dock;mining_public"

/**********************Mining car (Crate like thing, not the rail car)**************************/

/obj/structure/closet/crate/miningcar
	name = "Minecart"
	desc = "For storing valuable ores, or kidnapped locals."
	icon_state = "miningcar"
