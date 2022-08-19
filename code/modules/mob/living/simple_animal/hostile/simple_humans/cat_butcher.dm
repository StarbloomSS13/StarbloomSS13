/mob/living/simple_animal/hostile/simple_human/cat_butcherer
	name = "Cat Surgeon"
	desc = "A man with the quest of chasing endless feline tail."
	speed = 0
	stat_attack = HARD_CRIT
	robust_searching = TRUE
	attack_verb_continuous = "slashes at"
	attack_verb_simple = "slash at"
	attack_sound = 'sound/weapons/circsawhit.ogg'
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	sentience_type = SENTIENCE_HUMANOID
	loot = list(/obj/effect/mob_spawn/corpse/human/cat_butcher)
	check_friendly_fire = TRUE
	outfit = /datum/outfit/cat_butcher

/mob/living/simple_animal/hostile/simple_human/cat_butcherer/AttackingTarget()
	. = ..()
	if(. && prob(35) && iscarbon(target))
		var/mob/living/carbon/human/L = target
		var/obj/item/organ/tail/cat/tail = L.getorgan(/obj/item/organ/tail/cat)
		if(!QDELETED(tail))
			visible_message(span_notice("[src] severs [L]'s tail in one swift swipe!"), span_notice("You sever [L]'s tail in one swift swipe."))
			tail.Remove(L)
			var/obj/item/organ/tail/cat/dropped_tail = new(target.drop_location())
			dropped_tail.color = L.hair_color
		return 1
