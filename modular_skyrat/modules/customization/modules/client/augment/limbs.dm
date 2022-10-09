/datum/augment_item/limb
	category = AUGMENT_CATEGORY_LIMBS
	allowed_biotypes = MOB_ORGANIC|MOB_ROBOTIC
	///Hardcoded styles that can be chosen from and apply to limb, if it's true
	var/uses_robotic_styles = TRUE

/datum/augment_item/limb/apply(mob/living/carbon/human/apply_to, character_setup = FALSE, datum/preferences/prefs)
	if(character_setup)
		//Cheaply "faking" the appearance of the prosthetic. Species code sets this back if it doesnt exist anymore
		var/obj/item/bodypart/bodypart_path = path
		var/obj/item/bodypart/old_bodypart = apply_to.get_bodypart(initial(bodypart_path.body_zone))
		if(uses_robotic_styles && prefs.augment_limb_styles[slot])
			old_bodypart.icon = GLOB.robotic_styles_list[prefs.augment_limb_styles[slot]]
		else
			old_bodypart.icon = initial(bodypart_path.icon)
		old_bodypart.icon_state = initial(bodypart_path.icon_state)
		old_bodypart.should_draw_greyscale = FALSE

	else
		var/obj/item/bodypart/new_bodypart = new path(apply_to)
		var/obj/item/bodypart/old_bodypart = apply_to.get_bodypart(new_bodypart.body_zone)
		if(uses_robotic_styles && prefs.augment_limb_styles[slot])
			new_bodypart.set_icon_static(GLOB.robotic_styles_list[prefs.augment_limb_styles[slot]])
		new_bodypart.replace_limb(apply_to, TRUE)
		qdel(old_bodypart)

//HEADS
/datum/augment_item/limb/head
	slot = AUGMENT_SLOT_HEAD

/datum/augment_item/limb/head/cyborg
	name = "Cyborg"
	path = /obj/item/bodypart/head/robot/weak

//CHESTS
/datum/augment_item/limb/chest
	slot = AUGMENT_SLOT_CHEST

/datum/augment_item/limb/chest/cyborg
	name = "Cyborg"
	path = /obj/item/bodypart/chest/robot/weak

//LEFT ARMS
/datum/augment_item/limb/l_arm
	slot = AUGMENT_SLOT_L_ARM

/datum/augment_item/limb/l_arm/prosthetic
	name = "Prosthetic"
	path = /obj/item/bodypart/l_arm/robot/surplus
	cost = -1

/datum/augment_item/limb/l_arm/cyborg
	name = "Cyborg"
	path = /obj/item/bodypart/l_arm/robot/weak

//RIGHT ARMS
/datum/augment_item/limb/r_arm
	slot = AUGMENT_SLOT_R_ARM

/datum/augment_item/limb/r_arm/prosthetic
	name = "Prosthetic"
	path = /obj/item/bodypart/r_arm/robot/surplus
	cost = -1

/datum/augment_item/limb/r_arm/cyborg
	name = "Cyborg"
	path = /obj/item/bodypart/r_arm/robot/weak

//LEFT LEGS
/datum/augment_item/limb/l_leg
	slot = AUGMENT_SLOT_L_LEG

/datum/augment_item/limb/l_leg/prosthetic
	name = "Prosthetic"
	path = /obj/item/bodypart/l_leg/robot/surplus
	cost = -1

/datum/augment_item/limb/l_leg/cyborg
	name = "Cyborg"
	path = /obj/item/bodypart/l_leg/robot/weak

//RIGHT LEGS
/datum/augment_item/limb/r_leg
	slot = AUGMENT_SLOT_R_LEG

/datum/augment_item/limb/r_leg/prosthetic
	name = "Prosthetic"
	path = /obj/item/bodypart/r_leg/robot/surplus
	cost = -1

/datum/augment_item/limb/r_leg/cyborg
	name = "Cyborg"
	path = /obj/item/bodypart/r_leg/robot/weak
