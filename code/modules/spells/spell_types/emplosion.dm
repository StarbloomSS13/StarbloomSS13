/obj/effect/proc_holder/spell/targeted/emplosion
	name = "Emplosion"
	desc = "This spell emplodes an area."

	school = SCHOOL_EVOCATION
	var/emp_heavy = 2
	var/emp_light = 3

	action_icon_state = "emp"
	sound = 'sound/weapons/zapbang.ogg'

/obj/effect/proc_holder/spell/targeted/emplosion/cast(list/targets, mob/user = usr)
	playsound(get_turf(user), sound, 50,TRUE)
	for(var/mob/living/target in targets)
		if(target.can_block_magic())
			continue
		empulse(target.loc, emp_heavy, emp_light)

	return
