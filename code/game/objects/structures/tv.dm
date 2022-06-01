/obj/structure/tv
	name = "Xiaoyu Television Set"
	desc = "A cheaply made television set patterned off of an ancient design from Old Earth. Incapable of streaming content, it comes preloaded with shows. All atrocious, the manufacturer assures."
	icon = 'icons/obj/tv.dmi'
	icon_state = "off"
	var/list/sprites = list("space", "soviet", "cooking", "nature", "anime")

/obj/structure/tv/examine(mob/user)
	.=..()
	if (isliving(user))
		to_chat(user, "You notice that the off button has the letters 'CTRL' on it. And the channel change button reads 'ALT'. Huh.")

/obj/structure/tv/AltClick(mob/user)
	playsound(src, "sound/effects/tvclick.ogg", 50, 1)
	icon_state = pick(sprites)
	.=..()

/obj/structure/tv/CtrlClick(mob/user)
	icon_state = "off"

/obj/structure/tv/emag_act(mob/user)
	icon_state = "emag"
	honkerblast(src)
