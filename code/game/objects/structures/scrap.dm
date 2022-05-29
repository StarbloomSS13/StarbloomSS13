/obj/structure/scrap
	name = "scrap pile"
	desc = "A pile of debris, dragged in from space."
	icon = 'icons/obj/scrap.dmi'
	icon_state = "scrap"
	anchored = TRUE
	opacity = FALSE
	var/list/ways = list("pokes around in", "searches", "scours", "digs through", "rummages through", "goes through","picks through")
	var/mat_type = /obj/item/stack/sheet/iron/five

/obj/structure/scrap/examine(var/mob/user)
	.=..()
	if (isliving(user))
		to_chat(user, "<span class='danger'>You could sift through it with a shoveling tool to uncover more contents.</span>")

/obj/structure/scrap/proc/hurt_hand(mob/user)
	var/mob/living/carbon/human/victim = user
	if(victim.gloves)
		return FALSE
	else if(prob(20))
		to_chat(user, "<span class='danger'>Ouch! You cut yourself while picking through \the [src].</span>")
		victim.take_damage(5 , BRUTE, MELEE, 1)
	return TRUE

/obj/structure/scrap/attack_hand(mob/user)
	if(hurt_hand(user))
		return
	playsound(src, "rummage", 50, 1)
	.=..()

/obj/structure/scrap/attackby(obj/item/tool, mob/user, params)
	if(tool.tool_behaviour == TOOL_SHOVEL)
		user.visible_message(span_notice("[user] [pick(ways)] \the [src]..."))
		if(tool.use_tool(src, user, 150, volume = 100))
			user.visible_message(span_notice("[user] [pick(ways)] what remains of \the [src]."))
			qdel(src)
	else

/obj/structure/scrap/plasma
	name = "shimmering scrap pile"
	desc = "A pile of rare, shimmering debris, dragged in from space."
	icon = 'icons/obj/scrap.dmi'
	icon_state = "scrap_rare"
	mat_type = /obj/item/stack/sheet/mineral/plasma
