/obj/effect/falling_effect
	name = "you should not see this"
	desc = "no data"
	invisibility = 101
	anchored = TRUE
	density = FALSE
	var/falling_type = /obj/structure/scrap

/obj/effect/falling_effect/Initialize(mapload, type = /obj/structure/scrap)
	..()
	falling_type = type
	return INITIALIZE_HINT_LATELOAD

/obj/effect/falling_effect/LateInitialize()
	new falling_type(src)
	var/atom/movable/dropped = pick(contents) // Stupid, but allows to get spawn result without efforts if it is other type(Or if it was randomly generated).
	dropped.loc = get_turf(src)
	var/initial_x = dropped.pixel_x
	var/initial_y = dropped.pixel_y
	dropped.pixel_x = rand(-150, 150)
	dropped.pixel_y = 500 // When you think that pixel_z is height but you are wrong
	dropped.density = FALSE
	dropped.opacity = FALSE
	animate(dropped, pixel_y = initial_y, pixel_x = initial_x , time = 7)
	addtimer(CALLBACK(dropped, /atom/movable.proc/end_fall), 7)
	qdel(src)

/atom/movable/proc/end_fall()
	for(var/atom/movable/AM in loc)
		if(AM != src)
			AM.ex_act(1)

	for(var/mob/living/M in oviewers(6, src))
		shake_camera(M, 2, 2)

	playsound(loc, 'sound/effects/meteorimpact.ogg', 50, 1)
	density = initial(density)
	opacity = initial(opacity)
/obj/effect/falling_effect/singularity_act()
	return

/obj/effect/falling_effect/singularity_pull()
	return

/obj/effect/falling_effect/ex_act()
	return

/obj/structure/scrap_beacon
	name = "Scrap Beacon"
	desc = "This machine generates directional gravity rays which catch trash orbiting around."
	icon = 'icons/obj/scrap_beacon.dmi'
	icon_state = "beacon0"
	anchored = TRUE
	density = TRUE
	layer = MOB_LAYER + 1
	var/summon_cooldown = 20 MINUTES
	var/impact_speed = 3
	var/impact_prob = 100
	var/impact_range = 2
	var/last_summon = -24000
	var/active = 0

/obj/structure/scrap_beacon/attack_hand(mob/user)
	.=..()
	if((last_summon + summon_cooldown) >= world.time)
		to_chat(user, "<span class='notice'>[name] not charged yet.</span>")
		return
	last_summon = world.time
	if(!active)
		start_scrap_summon()

/obj/structure/scrap_beacon/proc/start_scrap_summon()
	set waitfor = FALSE

	active = TRUE
	icon_state = "beacon1"
	visible_message("<span class='notice'><b><font size='3px'><font color='red'>An alarm blares as the scrap beacon turns on and begins pulling debris from space!</font></b></span>")
	playsound(src.loc, "sound/misc/bloblarm.ogg", 100, 1)
	sleep(60)
	var/list/flooring_near_beacon = list()
	for(var/turf/T in RANGE_TURFS(impact_range, src))
		if(!istype(T,/turf/open/floor/engine/beacon))
			continue
		if((locate(/obj/structure/scrap) in T))
			continue
		if(!prob(impact_prob))
			continue
		flooring_near_beacon += T
	flooring_near_beacon -= loc
	while(flooring_near_beacon.len > 0)
		sleep(impact_speed)
		var/turf/newloc = pick(flooring_near_beacon)
		flooring_near_beacon -= newloc
		if(prob(80))
			new /obj/effect/falling_effect(newloc, /obj/structure/scrap)
		else
			new /obj/effect/falling_effect(newloc, /obj/structure/scrap/plasma)
	active = FALSE
	icon_state = "beacon0"
