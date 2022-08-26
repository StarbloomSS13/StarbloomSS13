/obj/effect/proc_holder/spell/targeted/forcewall
	name = "Shard Wall"
	desc = "Create a crystalline barrier that only you can pass through."
	charge_max = 100
	clothes_req = FALSE
	sound = 'sound/magic/forcewall.ogg'
	action_icon_state = "shield"
	range = -1
	include_user = TRUE
	cooldown_min = 50 //12 deciseconds reduction per rank
	var/wall_type = /obj/effect/forcefield/wizard

/obj/effect/proc_holder/spell/targeted/forcewall/cast(list/targets,mob/user = usr)
	new wall_type(get_turf(user),user)
	if(user.dir == SOUTH || user.dir == NORTH)
		new wall_type(get_step(user, EAST),user)
		new wall_type(get_step(user, WEST),user)
	else
		new wall_type(get_step(user, NORTH),user)
		new wall_type(get_step(user, SOUTH),user)


/obj/effect/forcefield/wizard
	var/mob/wizard

/obj/effect/forcefield/wizard/Initialize(mapload, mob/summoner)
	. = ..()
	wizard = summoner

/obj/effect/forcefield/wizard/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()
	if(mover == wizard)
		return TRUE
	if(isliving(mover))
		var/mob/M = mover
		if(M.can_block_magic(charge_cost = 0))
			return TRUE
