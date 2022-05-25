///This will check if GLOB.sprite_accessories[mutant_part]?[part_name] is associated with sprite accessory with factual TRUE.
/proc/is_factual_sprite_accessory(mutant_part, part_name)
	if(!mutant_part || !part_name)
		return FALSE
	var/datum/sprite_accessory/accessory = GLOB.sprite_accessories[mutant_part]?[part_name]
	return accessory?.factual
