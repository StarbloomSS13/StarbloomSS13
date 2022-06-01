/obj/structure/scrap
	name = "scrap pile"
	desc = "A pile of debris, dragged in from space."
	icon = 'icons/obj/scrap.dmi'
	icon_state = "scrap"
	anchored = TRUE
	var/list/ways = list("pokes around in", "searches", "scours", "digs through", "rummages through", "goes through","picks through")
	var/list/oreslistcommon = list(
		/obj/item/stack/ore/iron,
		/obj/item/stack/ore/glass
	)

	var/list/oreslistrare = list(
		/obj/item/stack/ore/plasma,
		/obj/item/stack/ore/silver,
		/obj/item/stack/ore/gold,
		/obj/item/stack/ore/diamond,
		/obj/item/stack/ore/titanium,
		/obj/item/stack/ore/plasma
	)

	var/list/partslist = list(
		/obj/item/stock_parts/capacitor/adv,
		/obj/item/stock_parts/scanning_module/adv,
		/obj/item/stock_parts/manipulator/nano,
		/obj/item/stock_parts/micro_laser/high,
		/obj/item/stock_parts/matter_bin/adv
	)

/obj/structure/scrap/examine(mob/user)
	.=..()
	if (isliving(user))
		to_chat(user, "<span class='danger'>You'd probably need a shovel to poke through this...</span>")

/obj/structure/scrap/attack_hand(mob/user)
	playsound(src, "rummage", 50, 1)
	.=..()

/obj/structure/scrap/attackby(obj/item/tool, mob/user, params)
	if(tool.tool_behaviour == TOOL_SHOVEL)
		user.visible_message(span_notice("[user] [pick(ways)] \the [src]..."))
		if(tool.use_tool(src, user, 150, volume = 100))
			user.visible_message(span_notice("[user] [pick(ways)] what remains of \the [src]."))
			var/list/trash_types = subtypesof(/obj/item/trash)
			var/list/part_types = partslist.Copy()
			if (prob(70))
				if (prob(70))
					new /obj/item/stack/ore/iron(get_turf(src))
					new /obj/item/stack/ore/glass(get_turf(src))
					for(var/i in 1 to 5)
						var/oreloot = pick(oreslistcommon)
						new oreloot(get_turf(src))
				else
					for(var/i in 1 to 2)
					var/orelootrare = pick(oreslistrare)
					new orelootrare(get_turf(src))
			else
				for(var/i in 1 to 3)
					var/parts = pick_n_take(part_types)
					new parts(get_turf(src))
			for(var/i in 1 to 3)
				var/trash = pick_n_take(trash_types)
				new trash(get_turf(src))
			qdel(src)
