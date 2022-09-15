// Pain effects - mood and modifiers, and other such things.

// Fullscreen flash for pain (red circle, blood screen (so real))
/atom/movable/screen/fullscreen/pain
	icon = 'icons/hud/pain_screen_flash.dmi'
	icon_state = "painoverlay"
	layer = UI_DAMAGE_LAYER

/mob/living/carbon/proc/flash_pain_overlay(severity = 1, time = 1 SECONDS)
	overlay_fullscreen("pain", /atom/movable/screen/fullscreen/pain, severity)
	clear_fullscreen("pain", time)

// Pain movespeed mods, only apply walking
/datum/movespeed_modifier/pain
	id = MOVESPEED_ID_PAIN
	movetypes = GROUND

// >= 100 total pain
/datum/movespeed_modifier/pain/light
	multiplicative_slowdown = 0.1

// >= 200 total pain
/datum/movespeed_modifier/pain/medium
	multiplicative_slowdown = 0.2

// >= 300 total pain
/datum/movespeed_modifier/pain/heavy
	multiplicative_slowdown = 0.35

// >= 400 total pain
/datum/movespeed_modifier/pain/crippling
	multiplicative_slowdown = 0.5

// Pain actionspeed mod (doafters)
/datum/actionspeed_modifier/pain
	id = ACTIONSPEED_ID_PAIN

// >= 100 total pain
/datum/actionspeed_modifier/pain/light
	multiplicative_slowdown = 0.1

// >= 200 total pain
/datum/actionspeed_modifier/pain/medium
	multiplicative_slowdown = 0.2

// >= 300 total pain
/datum/actionspeed_modifier/pain/heavy
	multiplicative_slowdown = 0.35

// >= 400 total pain
/datum/actionspeed_modifier/pain/crippling
	multiplicative_slowdown = 0.5

// Pain moodlets

// >= 100 total pain
/datum/mood_event/light_pain
	description = "Everything aches."
	mood_change = -3

// >= 200 total pain
/datum/mood_event/med_pain
	description = "Everything feels sore."
	mood_change = -6

// >= 300 total pain
/datum/mood_event/heavy_pain
	description = "Everything hurts!"
	mood_change = -10

// >= 400 total pain
/datum/mood_event/crippling_pain
	description = "STOP THE PAIN!"
	mood_change = -15

// Applied when you go under the knife with anesthesia
/datum/mood_event/anesthetic
	description = "Thank science for modern medicine."
	mood_change = 2
	timeout = 6 MINUTES

// Applied by most surgeries if you get operated on without anesthetics
/datum/mood_event/surgery
	description = "They're operating on me while I'm awake!"
	mood_change = -6
	timeout = 3 MINUTES

// Applied by some surgeries that are especially bad without anesthetics
/datum/mood_event/surgery/major
	description = "THEY'RE CUTTING ME OPEN!!"
	mood_change = -10
	timeout = 6 MINUTES
