
#define EMOTE_DELAY 5 SECONDS //To prevent spam emotes.

/mob
	var/nextsoundemote = 1 //Time at which the next emote can be played

/datum/emote
	cooldown = EMOTE_DELAY

//Disables the custom emote blacklist from TG that normally applies to slimes.
/datum/emote/living/custom
	mob_type_blacklist_typecache = list(/mob/living/brain)
	cooldown = 0

//me-verb emotes should not have a cooldown check
/datum/emote/living/custom/check_cooldown(mob/user, intentional)
	return TRUE


/datum/emote/living/cough/get_sound(mob/living/user)
	if(iscarbon(user))
		if(user.gender == MALE)
			return pick('starbloom_modules/emotes/sound/emotes/male/male_cough_1.ogg',
						'starbloom_modules/emotes/sound/emotes/male/male_cough_2.ogg',
						'starbloom_modules/emotes/sound/emotes/male/male_cough_3.ogg')
		return pick('starbloom_modules/emotes/sound/emotes/female/female_cough_1.ogg',
					'starbloom_modules/emotes/sound/emotes/female/female_cough_2.ogg',
					'starbloom_modules/emotes/sound/emotes/female/female_cough_3.ogg')
	return

/datum/emote/living/sneeze
	vary = TRUE

/datum/emote/living/sneeze/get_sound(mob/living/user)
	if(iscarbon(user))
		if(user.gender == MALE)
			return 'starbloom_modules/emotes/sound/emotes/male/male_sneeze.ogg'
		return 'starbloom_modules/emotes/sound/emotes/female/female_sneeze.ogg'
	return

/datum/emote/living/snap
	key = "snap"
	key_third_person = "snaps"
	message = "snaps their fingers."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	hands_use_check = TRUE
	vary = TRUE
	sound = 'starbloom_modules/emotes/sound/voice/snap.ogg'

/datum/emote/living/awoo
	key = "awoo"
	key_third_person = "awoos"
	message = "lets out an awoo!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'starbloom_modules/emotes/sound/voice/awoo.ogg'

/datum/emote/living/nya
	key = "nya"
	key_third_person = "nyas"
	message = "lets out a nya!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'starbloom_modules/emotes/sound/voice/nya.ogg'

/datum/emote/living/chirp
	key = "chirp"
	key_third_person = "lets out a tiny squeak"
	message = "lets out a tiny squeak!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'starbloom_modules/emotes/sound/voice/mothsqueak.ogg'

/datum/emote/living/mousesqueak
	key = "squeak"
	key_third_person = "squeaks"
	message = "squeaks!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'sound/effects/mousesqueek.ogg'

/datum/emote/living/squish
	key = "squish"
	key_third_person = "squishes"
	message = "squishes!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'starbloom_modules/emotes/sound/voice/slime_squish.ogg'

/datum/emote/living/hiss
	key = "hiss1"
	key_third_person = "hisses"
	message = "hisses!"
	emote_type = EMOTE_AUDIBLE
	mob_type_allowed_typecache = list(/mob/living/carbon, /mob/living/silicon/pai)
	vary = TRUE
	sound = 'starbloom_modules/emotes/sound/emotes/hiss.ogg'

/datum/emote/living/sigh/get_sound(mob/living/user)
	if(iscarbon(user))
		if(user.gender == MALE)
			return 'starbloom_modules/emotes/sound/emotes/male/male_sigh.ogg'
		return 'starbloom_modules/emotes/sound/emotes/female/female_sigh.ogg'
	return

/datum/emote/living/sniff
	vary = TRUE

/datum/emote/living/sniff/get_sound(mob/living/user)
	if(iscarbon(user))
		if(user.gender == MALE)
			return 'starbloom_modules/emotes/sound/emotes/male/male_sniff.ogg'
		return 'starbloom_modules/emotes/sound/emotes/female/female_sniff.ogg'
	return

/datum/emote/living/gasp/get_sound(mob/living/user)
	if(iscarbon(user))
		if(user.gender == MALE)
			return pick('starbloom_modules/emotes/sound/emotes/male/gasp_m1.ogg',
						'starbloom_modules/emotes/sound/emotes/male/gasp_m2.ogg',
						'starbloom_modules/emotes/sound/emotes/male/gasp_m3.ogg',
						'starbloom_modules/emotes/sound/emotes/male/gasp_m4.ogg',
						'starbloom_modules/emotes/sound/emotes/male/gasp_m5.ogg',
						'starbloom_modules/emotes/sound/emotes/male/gasp_m6.ogg')
		return pick('starbloom_modules/emotes/sound/emotes/female/gasp_f1.ogg',
					'starbloom_modules/emotes/sound/emotes/female/gasp_f2.ogg',
					'starbloom_modules/emotes/sound/emotes/female/gasp_f3.ogg',
					'starbloom_modules/emotes/sound/emotes/female/gasp_f4.ogg',
					'starbloom_modules/emotes/sound/emotes/female/gasp_f5.ogg',
					'starbloom_modules/emotes/sound/emotes/female/gasp_f6.ogg')
	return

/datum/emote/living/snore
	vary = TRUE
	sound = 'starbloom_modules/emotes/sound/emotes/snore.ogg'

/datum/emote/living/burp
	vary = TRUE

/datum/emote/living/burp/get_sound(mob/living/user)
	if(iscarbon(user))
		if(user.gender == MALE)
			return 'starbloom_modules/emotes/sound/emotes/male/burp_m.ogg'
		return 'starbloom_modules/emotes/sound/emotes/female/burp_f.ogg'
	return

/datum/emote/living/clap
	key = "clap"
	key_third_person = "claps"
	message = "claps."
	muzzle_ignore = TRUE
	hands_use_check = TRUE
	emote_type = EMOTE_AUDIBLE
	audio_cooldown = 5 SECONDS
	vary = TRUE
	mob_type_allowed_typecache = list(/mob/living/carbon, /mob/living/silicon/pai)

/datum/emote/living/clap/get_sound(mob/living/user)
	return pick('starbloom_modules/emotes/sound/emotes/clap1.ogg',
				'starbloom_modules/emotes/sound/emotes/clap2.ogg',
				'starbloom_modules/emotes/sound/emotes/clap3.ogg',
				'starbloom_modules/emotes/sound/emotes/clap4.ogg')

/datum/emote/living/clap/can_run_emote(mob/living/carbon/user, status_check = TRUE , intentional)
	if(user.usable_hands < 2)
		return FALSE
	return ..()

/datum/emote/living/clap1
	key = "clap1"
	key_third_person = "claps once"
	message = "claps once."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	hands_use_check = TRUE
	vary = TRUE
	mob_type_allowed_typecache = list(/mob/living/carbon, /mob/living/silicon/pai)

/datum/emote/living/clap1/get_sound(mob/living/user)
	return pick('starbloom_modules/emotes/sound/emotes/claponce1.ogg',
				'starbloom_modules/emotes/sound/emotes/claponce2.ogg')

/datum/emote/living/clap1/can_run_emote(mob/living/carbon/user, status_check = TRUE , intentional)
	if(user.usable_hands < 2)
		return FALSE
	return ..()

/datum/emote/living/headtilt
	key = "tilt"
	key_third_person = "tilts"
	message = "tilts their head."
	message_AI = "tilts the image on their display."

/datum/emote/beep
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'starbloom_modules/emotes/sound/emotes/twobeep.ogg'
	mob_type_allowed_typecache = list(/mob/living) //Beep already exists on brains and silicons

/datum/emote/living/blink2
	key = "blink2"
	key_third_person = "blinks twice"
	message = "blinks twice."
	message_AI = "has their display flicker twice."

/datum/emote/living/rblink
	key = "rblink"
	key_third_person = "rapidly blinks"
	message = "rapidly blinks!"
	message_AI = "has their display port flash rapidly!"

/datum/emote/living/squint
	key = "squint"
	key_third_person = "squints"
	message = "squints."
	message_AI = "zooms in."

/datum/emote/living/smirk
	key = "smirk"
	key_third_person = "smirks"
	message = "smirks."

/datum/emote/living/eyeroll
	key = "eyeroll"
	key_third_person = "rolls their eyes"
	message = "rolls their eyes."

/datum/emote/living/huff
	key = "huffs"
	key_third_person = "huffs"
	message = "huffs!"

/datum/emote/living/etwitch
	key = "etwitch"
	key_third_person = "twitches their ears"
	message = "twitches their ears!"

/datum/emote/living/clear
	key = "clear"
	key_third_person = "clears their throat"
	message = "clears their throat."

/datum/emote/living/whistle
	key = "whistle"
	key_third_person = "whistles"
	message = "whistles."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/blep
	key = "blep"
	key_third_person = "bleps"
	message = "bleps their tongue out. Blep."
	message_AI = "shows an image of a random blepping animal. Blep."
	message_robot = "bleps their robo-tongue out. Blep."

/datum/emote/living/warble
	key = "warble"
	key_third_person = "warbles"
	message = "warbles!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'starbloom_modules/emotes/sound/voice/warbles.ogg'

/datum/emote/living/trills
	key = "trills"
	key_third_person = "trills!"
	message = "trills!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'starbloom_modules/emotes/sound/voice/trills.ogg'
