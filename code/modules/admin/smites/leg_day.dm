/// Gives the target critically bad wounds
/datum/smite/legday
	name = "Leg Day"

/datum/smite/legday/effect(client/user, mob/living/target)
	. = ..()

	if (!iscarbon(target))
		to_chat(user, span_warning("This must be used on a carbon mob."), confidential = TRUE)
		return

	var/mob/living/carbon/carbon_target = target
	for(var/_limb in carbon_target.bodyparts)
		var/obj/item/bodypart/limb = _limb
		var/type_wound = pick(list(/datum/wound/muscle/severe, /datum/wound/muscle/moderate))
		limb.force_wound_upwards(type_wound, smited = TRUE)
