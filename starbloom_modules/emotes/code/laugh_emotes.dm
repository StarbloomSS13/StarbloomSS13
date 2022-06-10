/datum/emote/living/laugh
	key = "laugh"
	key_third_person = "laughs"
	message = "laughs."
	message_mime = "laughs silently!"
	emote_type = EMOTE_AUDIBLE
	audio_cooldown = 5 SECONDS
	vary = TRUE
	mob_type_allowed_typecache = list(/mob/living/carbon, /mob/living/silicon/pai)

/datum/emote/living/laugh/get_sound(mob/living/user)
	if(iscarbon(user))
		if(user.gender == MALE)
			return pick('sound/voice/human/manlaugh1.ogg',
						'sound/voice/human/manlaugh2.ogg')
		else
			return pick('starbloom_modules/emotes/sound/emotes/female/female_giggle_1.ogg',
					'starbloom_modules/emotes/sound/emotes/female/female_giggle_2.ogg')
	return
