/// Trim for Edict mobs, outfits and corpses. Not chameleon.
/datum/id_trim/lastedict
	assignment = "Last Edict Operator"
	trim_state = "trim_edict"
	department_color = COLOR_EDICT_VIOLET
	subdepartment_color = COLOR_EDICT_VIOLET
	sechud_icon_state = SECHUD_EDICT
	access = list(ACCESS_EDICT)

/// Trim originally meant for forgottenship.dmm / cybersun
/datum/id_trim/lastedict/robotics
	access = list(ACCESS_EDICT, ACCESS_ROBOTICS)

/// Trim originally meant for forgottenship.dmm / cybersun
/datum/id_trim/lastedict/pilot
	assignment = "Last Edict Flightman"
	trim_state = "trim_captain"
	access = list(ACCESS_EDICT, ACCESS_EDICT_LEADER, ACCESS_ROBOTICS)

/// Trim for Syndicate mobs, outfits and corpses.
/datum/id_trim/battlecruiser
	assignment = "Syndicate Battlecruiser Crew"
	trim_state = "trim_syndicate"
	access = list(ACCESS_EDICT)

/// Trim for Syndicate mobs, outfits and corpses.
/datum/id_trim/battlecruiser/captain
	assignment = "Syndicate Battlecruiser Captain"
	access = list(ACCESS_EDICT, ACCESS_EDICT_LEADER)

/// Trim for Chameleon ID cards. Many outfits, nuke ops and some corpses hold Chameleon ID cards.
/datum/id_trim/chameleon
	assignment = "Unknown"
	access = list(ACCESS_EDICT, ACCESS_MAINT_TUNNELS)

/// Trim for Chameleon ID cards. Many outfits, nuke ops and some corpses hold Chameleon ID cards.
/datum/id_trim/chameleon/operative
	assignment = "Last Edict Operative"
	trim_state = "trim_edict"
	department_color = COLOR_EDICT_VIOLET
	subdepartment_color = COLOR_EDICT_VIOLET
	sechud_icon_state = SECHUD_EDICT

/// Trim for Chameleon ID cards. Many outfits, nuke ops and some corpses hold Chameleon ID cards.
/datum/id_trim/chameleon/operative/nuke_leader
	assignment = "Last Edict Commandant"
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_EDICT, ACCESS_EDICT_LEADER)

/// Trim for Chameleon ID cards. Many outfits, nuke ops and some corpses hold Chameleon ID cards.
/datum/id_trim/chameleon/operative/clown
	assignment = "Syndicate Entertainment Operative"
	trim_state = "trim_clown"
	department_color = COLOR_SYNDIE_RED
	subdepartment_color = COLOR_SYNDIE_RED

/// Trim for Chameleon ID cards. Many outfits, nuke ops and some corpses hold Chameleon ID cards.
/datum/id_trim/chameleon/operative/clown_leader
	assignment = "Syndicate Entertainment Operative Leader"
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_EDICT, ACCESS_EDICT_LEADER)
