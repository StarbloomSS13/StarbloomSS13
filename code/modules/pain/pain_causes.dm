// -- Causes of pain, from non-modular actions --
// Surgeries
/datum/surgery_step/saw/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results)
	. = ..()
	if(target.stat == CONSCIOUS)
		var/obj/item/organ/lungs/our_lungs = target.getorganslot(ORGAN_SLOT_LUNGS)
		if(target.IsSleeping() && our_lungs?.on_anesthetic)
			SEND_SIGNAL(target, COMSIG_ADD_MOOD_EVENT, "surgery", /datum/mood_event/anesthetic)
		else
			SEND_SIGNAL(target, COMSIG_ADD_MOOD_EVENT, "surgery", /datum/mood_event/surgery)
			target.flash_pain_overlay(2)

/datum/surgery_step/incise/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	. = ..()
	target.cause_pain(target_zone, 12) // incise doesn't actually deal any direct dmg, unlike saw
	if(target.stat == CONSCIOUS)
		var/obj/item/organ/lungs/our_lungs = target.getorganslot(ORGAN_SLOT_LUNGS)
		if(target.IsSleeping() && our_lungs?.on_anesthetic)
			SEND_SIGNAL(target, COMSIG_ADD_MOOD_EVENT, "surgery", /datum/mood_event/anesthetic)
		else
			SEND_SIGNAL(target, COMSIG_ADD_MOOD_EVENT, "surgery", /datum/mood_event/surgery/major)
			target.flash_pain_overlay(1)

/*
/datum/surgery_step/replace_limb/success(mob/living/user, mob/living/carbon/target, target_zone, obj/item/bodypart/tool, datum/surgery/surgery, default_display_results = FALSE)
	. = ..()
	if(target.pain_controller && (tool in target.bodyparts))
		// We have to snowflake this because replace_limb uses SPECIAL = TRUE when replacing limbs (which doesn't cause pain because I hate limb code)
		target.cause_pain(target_zone, initial(tool.pain))
		target.cause_pain(BODY_ZONE_CHEST, PAIN_LIMB_REMOVED)
		target.apply_min_pain(target_zone, 15, 2 MINUTES)
*/
