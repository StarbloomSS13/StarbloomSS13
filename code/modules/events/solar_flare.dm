/// Solar flare event. Spawns fire explosions in a department.
/datum/round_event_control/solar_flare
	name = "Solar Flare"
	typepath = /datum/round_event/solar_flare

	weight = 10
	max_occurrences = 1
	earliest_start = 20 MINUTES

	/// For admins, see [/datum/round_event/solar_flare/var/announcement_provides_detail]
	var/detailed_announcement = FALSE
	/// For admins, see [/datum/round_event/solar_flare/var/picked_dept]
	var/preset_dept

	/// Static list of all areas we can trigger on
	var/static/list/possible_choices = list(
		DEPARTMENT_SECURITY = /area/security,
		DEPARTMENT_COMMAND = /area/command,
		DEPARTMENT_SERVICE = /area/service,
		DEPARTMENT_SCIENCE = /area/science,
		DEPARTMENT_ENGINEERING = /area/engineering,
		DEPARTMENT_MEDICAL = /area/medical,
		DEPARTMENT_CARGO = /area/cargo,
	)

/datum/round_event_control/solar_flare/admin_setup(mob/admin)
	preset_dept = tgui_input_list(admin, "What department?", "Solar flare target", possible_choices)
	detailed_announcement = (tgui_alert(admin, "(If announced) Should the alert tell the crew where it's triggered?", "Solar flare announcement", list("Yes", "No")) == "Yes")

/datum/round_event/solar_flare
	announceWhen = 5

	/// Whether the event was announced or hidden
	var/was_announced = TRUE
	/// Whether the event announcement details where the location is
	var/announcement_provides_detail = FALSE
	/// Time (in seconds) between flares.
	var/time_between_flares = 5
	/// Department string picked.
	var/picked_dept
	/// List of areas valid.
	var/list/area/impacted_areas

/datum/round_event/solar_flare/setup()
	startWhen = rand(45, 90) // 1 == 1 second.
	endWhen = startWhen + rand(90, 150)
	time_between_flares += rand(-1, 1)

/datum/round_event/solar_flare/announce(fake)
	if(!prob(announceChance))
		return

	if(!fake)
		was_announced = TRUE
	priority_announce("[command_name()] has issued an emergency solar weather warning for your station. \
		The afflicted area has not yet been detected. Stay alert, report any sightings of activity, \
		and evacuate affected departments.", "Solar Weather Alert")

/datum/round_event/solar_flare/start()

	var/datum/round_event_control/solar_flare/event_control = control
	picked_dept = event_control.preset_dept || pick(event_control.possible_choices)
	announcement_provides_detail = event_control.detailed_announcement || prob(30) // 30% chance that the event will reveal the location when it starts
	impacted_areas = get_areas(picked_dept, event_control.possible_choices[picked_dept])

	if(was_announced)
		priority_announce("A solar weather event is ocurring over \
			[announcement_provides_detail ? "the [picked_dept]" : "an undetected"] department. \
			[announcement_provides_detail ? "" : "All crew are to locate and report the afflicted area. "]\
			Evacuate all personnel and personal belongings from affected rooms until the weather has cleared.", "Solar Weather Alert")

	deadchat_broadcast("A <b>Solar Flare</b> event has triggered, targeting the [picked_dept] department.", message_type = DEADCHAT_ANNOUNCEMENT)
	message_admins("A solar flare event has triggered, targeting the [picked_dept] department.")

/datum/round_event/solar_flare/end()
	if(was_announced)
		priority_announce("[command_name()] has issued an all clear signal for your station. The solar weather event over the [picked_dept] department has cleared. Please return to your workplaces and resume duty.", "All Clear Alert")

/datum/round_event/solar_flare/tick()
	if(activeFor % time_between_flares != 0)
		return

	var/list/our_areas = LAZYCOPY(impacted_areas)
	for(var/i in 0 to rand(2, 4))
		if(!LAZYLEN(our_areas))
			return
		addtimer(CALLBACK(src, .proc/trigger_flare, pick_n_take(our_areas)), i SECONDS)

/**
 * Trigger a solar flare effect at a random non-dense turf in [chosen_area].
 */
/datum/round_event/solar_flare/proc/trigger_flare(area/chosen_area)
	var/turf/destination = get_valid_turf_from_area(chosen_area)
	if(!isturf(destination))
		return

	// Weight of picking each type of flare. Adds up to 100 for easy math.
	var/static/list/flare_types_to_weight = list(
		/obj/effect/solar_flare = 88,
		/obj/effect/solar_flare/large = 8,
		/obj/effect/solar_flare/emp = 4,
	)

	var/obj/effect/solar_flare/spawned_flare_type = pick_weight(flare_types_to_weight)
	new spawned_flare_type(destination)

/**
 * Get a random non-dense turf of all the turfs in [chosen_area].
 */
/datum/round_event/solar_flare/proc/get_valid_turf_from_area(area/chosen_area)
	RETURN_TYPE(/turf)
	var/list/turf/turfs = get_area_turfs(chosen_area)

	if(!LAZYLEN(turfs))
		return null

	for(var/turf/a_turf as anything in turfs)
		if(a_turf.density)
			turfs -= a_turf

	return pick(turfs)

/**
 * Get all areas associated with a department.
 */
/datum/round_event/solar_flare/proc/get_areas(department, area_path)
	RETURN_TYPE(/list)
	. = subtypesof(area_path)

	// There's are much better OOP ways of doing this but I don't really care
	switch(department)
		if(DEPARTMENT_SECURITY)
			. -= typesof(/area/security/checkpoint)

		if(DEPARTMENT_COMMAND)
			. -= /area/command/gateway

		if(DEPARTMENT_SERVICE)
			. -= typesof(/area/service/abandoned_gambling_den)
			. -= /area/service/electronic_marketing_den
			. -= /area/service/theater/abandoned
			. -= /area/service/library/abandoned
			. -= /area/service/hydroponics/garden/abandoned

		if(DEPARTMENT_CARGO)
			. += /area/security/checkpoint/supply

		if(DEPARTMENT_ENGINEERING)
			. -= typesof(/area/engineering/supermatter)
			. -= /area/engineering/gravity_generator
			. += /area/security/checkpoint/engineering

		if(DEPARTMENT_SCIENCE)
			. -= typesof(/area/security/checkpoint/science)
			. -= /area/science/research/abandoned
			. += /area/security/checkpoint/science

		if(DEPARTMENT_MEDICAL)
			. -= /area/medical/abandoned
			. += /area/security/checkpoint/medical

/// Solar flare. Causes a diamond of fire centered on the initial turf.
/obj/effect/solar_flare
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

	/// Max radius of the flare
	var/radius = 2
	/// Current radius we're at
	var/curr_radius = 0
	/// List of turfs we've yet to expose with the flare (via process)
	var/list/turf/turfs_to_heat
	/// List of turfs/mobs/whatever we already hit with the flare
	var/list/datum/weakref/already_heated_things

/obj/effect/solar_flare/Initialize(mapload)
	. = ..()
	if(!isturf(loc))
		stack_trace("Solar flare initialized in a non-turf loc, what?")
		return INITIALIZE_HINT_QDEL
	if(mapload)
		stack_trace("Who mapped in a solar flare? You shouldn't.")
		return INITIALIZE_HINT_QDEL

	turfs_to_heat = list(loc)
	start_flare_effect()

/obj/effect/solar_flare/Destroy(force)
	LAZYCLEARLIST(turfs_to_heat)
	LAZYCLEARLIST(already_heated_things)
	STOP_PROCESSING(SSfastprocess, src)
	return ..()

/// Starts the actual flare effect.
/obj/effect/solar_flare/proc/start_flare_effect()
	START_PROCESSING(SSfastprocess, src)
	playsound(loc, 'sound/magic/fireball.ogg', 60, TRUE)

/obj/effect/solar_flare/process(delta_time)
	for(var/select_turf in turfs_to_heat)
		do_flare(select_turf)

		for(var/side_turf in get_adjacent_open_turfs(select_turf))
			if(WEAKREF(side_turf) in already_heated_things)
				continue
			turfs_to_heat |= side_turf

		turfs_to_heat -= select_turf

	if(++curr_radius > radius)
		qdel(src)

/// Causes a flare to appear on the location, just 1 part of the flare.
/obj/effect/solar_flare/proc/do_flare(turf/location)
	new /obj/effect/hotspot(location)

	location.hotspot_expose(clamp((1000 - curr_radius * 100), 500, 1000), clamp((250 - curr_radius * 25), 100, 250), 1)
	LAZYADD(already_heated_things, WEAKREF(location))
	for(var/mob/living/hit_mob in location.contents)
		if(WEAKREF(hit_mob) in already_heated_things)
			continue
		LAZYADD(already_heated_things, WEAKREF(hit_mob))
		hit_mob.apply_damage((clamp(radius - curr_radius, 0.5, 3) * 30), BURN, spread_damage = TRUE)
		hit_mob.adjust_fire_stacks(clamp(radius - curr_radius, 1, 5))
		hit_mob.IgniteMob()

// Larger flare. Double radius.
/obj/effect/solar_flare/large
	radius = 4

// Slightly larger flare, comes with added EMP action, but much rarer
// Heaviest area of the EMP are in the very center of the flare
/obj/effect/solar_flare/emp
	radius = 3

/obj/effect/solar_flare/emp/start_flare_effect()
	. = ..()
	empulse(loc, 1, radius + 1)
