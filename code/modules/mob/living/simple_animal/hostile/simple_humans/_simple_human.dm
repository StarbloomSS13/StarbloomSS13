/mob/living/simple_animal/hostile/simple_human
	icon = 'icons/mob/simple_human.dmi'
	icon_state = "faceless"
	turns_per_move = 5
	maxHealth = 100
	health = 100
	unsuitable_atmos_damage = 7.5
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 15
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/weapons/punch1.ogg'
	combat_mode = TRUE
	del_on_death = TRUE

	/// Our outfit.
	var/outfit = /datum/outfit/job/assistant
	/// The item we're holding in our right hand, visually.
	var/held_item
	/// The item we're holding in our left hand, visually.
	var/held_item_left // Twilight Princess
	/// The species datum of the sprites generated
	var/species
	/// The slots that're covered in blood. Use defines (ITEM_SLOT_OCLOTHING, etc.)
	var/our_bloody_slots

/mob/living/simple_animal/hostile/simple_human/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/outfit_icon_gen, outfit, species, r_hand = held_item, l_hand = held_item_left, bloody_slots = our_bloody_slots)
