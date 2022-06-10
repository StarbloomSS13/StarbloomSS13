GLOBAL_LIST_EMPTY(laugh_types)

/datum/laugh_type
	var/name
	var/donator_only = FALSE
	var/list/male_laughsounds
	var/list/female_laughsounds
	var/restricted_species_type

/datum/laugh_type/human
	name = "Human Laugh"
	male_laughsounds = list('sound/voice/human/manlaugh1.ogg',
						'sound/voice/human/manlaugh2.ogg')
	female_laughsounds = list('starbloom_modules/emotes/sound/emotes/female/female_giggle_1.ogg',
					'starbloom_modules/emotes/sound/emotes/female/female_giggle_2.ogg')
