/**
 * This file contains all the trims associated with station jobs.
 * It also contains special prisoner trims and the miner's spare ID trim.
 */

/// ID Trims for station jobs.
/datum/id_trim/job
	trim_state = "trim_assistant"

	/// The extra access the card should have when CONFIG_GET(flag/jobs_have_minimal_access) is FALSE.
	var/list/extra_access = list()
	/// The extra wildcard_access the card should have when CONFIG_GET(flag/jobs_have_minimal_access) is FALSE.
	var/list/extra_wildcard_access = list()
	/// The base access the card should have when CONFIG_GET(flag/jobs_have_minimal_access) is TRUE.
	var/list/minimal_access = list()
	/// The base wildcard_access the card should have when CONFIG_GET(flag/jobs_have_minimal_access) is TRUE.
	var/list/minimal_wildcard_access = list()
	/// Static list. Cache of any mapping config job changes.
	var/static/list/job_changes
	/// What config entry relates to this job. Should be a lowercase job name with underscores for spaces, eg "prisoner" "research_director" "head_of_security"
	var/config_job
	/// An ID card with an access in this list can apply this trim to IDs or use it as a job template when adding access to a card. If the list is null, cannot be used as a template. Should be Head of Staff or ID Console accesses or it may do nothing.
	var/list/template_access
	/// The typepath to the job datum from the id_trim. This is converted to one of the job singletons in New().
	var/datum/job/job = /datum/job/unassigned

/datum/id_trim/job/New()
	if(ispath(job))
		job = SSjob.GetJobType(job)

	if(isnull(job_changes))
		job_changes = SSmapping.config.job_changes

	if(!length(job_changes) || !config_job)
		refresh_trim_access()
		return

	var/list/access_changes = job_changes[config_job]

	if(!length(access_changes))
		refresh_trim_access()
		return

	if(islist(access_changes["additional_access"]))
		extra_access |= access_changes["additional_access"]
	if(islist(access_changes["additional_minimal_access"]))
		minimal_access |= access_changes["additional_minimal_access"]
	if(islist(access_changes["additional_wildcard_access"]))
		extra_wildcard_access |= access_changes["additional_wildcard_access"]
	if(islist(access_changes["additional_minimal_wildcard_access"]))
		minimal_wildcard_access |= access_changes["additional_minimal_wildcard_access"]

	refresh_trim_access()

/**
 * Goes through various non-map config settings and modifies the trim's access based on this.
 *
 * Returns TRUE if the config is loaded, FALSE otherwise.
 */
/datum/id_trim/job/proc/refresh_trim_access()
	// If there's no config loaded then assume minimal access.
	if(!config)
		access = minimal_access.Copy()
		wildcard_access = minimal_wildcard_access.Copy()
		return FALSE

	// There is a config loaded. Check for the jobs_have_minimal_access flag being set.
	if(CONFIG_GET(flag/jobs_have_minimal_access))
		access = minimal_access.Copy()
		wildcard_access = minimal_wildcard_access.Copy()
	else
		access = minimal_access | extra_access
		wildcard_access = minimal_wildcard_access | extra_wildcard_access

	// If the config has global maint access set, we always want to add maint access.
	if(CONFIG_GET(flag/everyone_has_maint_access))
		access |= list(ACCESS_MAINT_TUNNELS)

	return TRUE

/datum/id_trim/job/assistant
	assignment = "Assistant"
	trim_state = "trim_assistant"
	sechud_icon_state = SECHUD_ASSISTANT
	extra_access = list(ACCESS_MAINT_TUNNELS)
	minimal_access = list()
	config_job = "assistant"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_CHANGE_IDS)
	job = /datum/job/assistant

/datum/id_trim/job/assistant/refresh_trim_access()
	. = ..()

	if(!.)
		return

	// Config has assistant maint access set.
	if(CONFIG_GET(flag/assistants_have_maint_access))
		access |= list(ACCESS_MAINT_TUNNELS)

/datum/id_trim/job/atmospheric_technician
	assignment = "Atmospheric Technician"
	trim_state = "trim_atmospherictechnician"
	department_color = COLOR_ENGINEERING_ORANGE
	subdepartment_color = COLOR_ENGINEERING_ORANGE
	sechud_icon_state = SECHUD_ATMOSPHERIC_TECHNICIAN
	extra_access = list(ACCESS_ENGINEERING, ACCESS_ENGINE_EQUIP, ACCESS_MINERAL_STOREROOM, ACCESS_TECH_STORAGE)
	minimal_access = list(ACCESS_ATMOSPHERICS, ACCESS_AUX_BASE, ACCESS_CONSTRUCTION, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_MAINT_TUNNELS, ACCESS_MECH_ENGINE,
					ACCESS_MINERAL_STOREROOM)
	config_job = "atmospheric_technician"
	template_access = list(ACCESS_CAPTAIN, ACCESS_CE, ACCESS_CHANGE_IDS)
	job = /datum/job/atmospheric_technician

/datum/id_trim/job/bartender
	assignment = "Bartender"
	trim_state = "trim_bartender"
	department_color = COLOR_SERVICE_LIME
	subdepartment_color = COLOR_SERVICE_LIME
	sechud_icon_state = SECHUD_BARTENDER
	extra_access = list(ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_MORGUE)
	minimal_access = list(ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE, ACCESS_WEAPONS, ACCESS_SERVICE)
	config_job = "bartender"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_CHANGE_IDS)
	job = /datum/job/bartender

/datum/id_trim/job/botanist
	assignment = "Hydroponicist"
	trim_state = "trim_botanist"
	department_color = COLOR_SERVICE_LIME
	subdepartment_color = COLOR_SERVICE_LIME
	sechud_icon_state = SECHUD_BOTANIST
	extra_access = list(ACCESS_BAR, ACCESS_KITCHEN)
	minimal_access = list(ACCESS_HYDROPONICS, ACCESS_MINERAL_STOREROOM, ACCESS_MORGUE, ACCESS_SERVICE)
	config_job = "botanist"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_CHANGE_IDS)
	job = /datum/job/botanist

/datum/id_trim/job/captain
	assignment = "Exarch"
	intern_alt_name = "Captain-in-Training"
	trim_state = "trim_captain"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_COMMAND_BLUE
	department_state = "departmenthead"
	sechud_icon_state = SECHUD_CAPTAIN
	config_job = "captain"
	template_access = list(ACCESS_CAPTAIN, ACCESS_CHANGE_IDS)
	job = /datum/job/captain

/// Captain gets all station accesses hardcoded in because it's the Captain.
/datum/id_trim/job/captain/New()
	var/list/common_access = (\
		SSid_access.get_flag_access_list(ACCESS_FLAG_COMMON) + \
		SSid_access.get_flag_access_list(ACCESS_FLAG_COMMAND) + \
		SSid_access.get_flag_access_list(ACCESS_FLAG_FACTIONAL))

	var/list/private_access = (\
		SSid_access.get_flag_access_list(ACCESS_FLAG_PRV_COMMAND) + \
		SSid_access.get_flag_access_list(ACCESS_FLAG_CAPTAIN))

	extra_access |= common_access
	extra_wildcard_access |= private_access
	minimal_access |= common_access
	minimal_wildcard_access |= private_access

	return ..()

/datum/id_trim/job/cargo_technician
	assignment = "Cargo Technician"
	trim_state = "trim_cargotechnician"
	department_color = COLOR_CARGO_BROWN
	subdepartment_color = COLOR_CARGO_BROWN
	sechud_icon_state = SECHUD_CARGO_TECHNICIAN
	extra_access = list(ACCESS_QM, ACCESS_SALVAGECREW, ACCESS_SALVAGECREW_STATION)
	minimal_access = list(ACCESS_CARGO, ACCESS_MAIL_SORTING, ACCESS_MAINT_TUNNELS, ACCESS_MECH_MINING, ACCESS_MINERAL_STOREROOM)
	config_job = "cargo_technician"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_CHANGE_IDS)
	job = /datum/job/cargo_technician

/datum/id_trim/job/chaplain
	assignment = "Chaplain"
	trim_state = "trim_chaplain"
	department_color = COLOR_SERVICE_LIME
	subdepartment_color = COLOR_SERVICE_LIME
	sechud_icon_state = SECHUD_CHAPLAIN
	extra_access = list()
	minimal_access = list(ACCESS_CHAPEL_OFFICE, ACCESS_CREMATORIUM, ACCESS_MORGUE, ACCESS_THEATRE, ACCESS_SERVICE)
	config_job = "chaplain"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_CHANGE_IDS)
	job = /datum/job/chaplain

/datum/id_trim/job/chemist
	assignment = "Chemist"
	trim_state = "trim_chemist"
	department_color = COLOR_MEDICAL_BLUE
	subdepartment_color = COLOR_MEDICAL_BLUE
	sechud_icon_state = SECHUD_CHEMIST
	extra_access = list(ACCESS_SURGERY, ACCESS_VIROLOGY)
	minimal_access = list(ACCESS_PLUMBING, ACCESS_MECH_MEDICAL, ACCESS_MEDICAL, ACCESS_MINERAL_STOREROOM, ACCESS_MORGUE, ACCESS_PHARMACY)
	config_job = "chemist"
	template_access = list(ACCESS_CAPTAIN, ACCESS_CMO, ACCESS_CHANGE_IDS)
	job = /datum/job/chemist

/datum/id_trim/job/chief_engineer
	assignment = "Mekhane Grand Engineer"
	intern_alt_name = "Chief Engineer-in-Training"
	trim_state = "trim_stationengineer"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_ENGINEERING_ORANGE
	department_state = "departmenthead"
	sechud_icon_state = SECHUD_CHIEF_ENGINEER
	extra_access = list(ACCESS_TELEPORTER)
	extra_wildcard_access = list()
	minimal_access = list(ACCESS_ATMOSPHERICS, ACCESS_AUX_BASE, ACCESS_CE, ACCESS_CONSTRUCTION, ACCESS_ENGINEERING, ACCESS_ENGINE_EQUIP, ACCESS_EVA,
					ACCESS_EXTERNAL_AIRLOCKS, ACCESS_COMMAND, ACCESS_KEYCARD_AUTH, ACCESS_MAINT_TUNNELS, ACCESS_MECH_ENGINE,
					ACCESS_MINERAL_STOREROOM, ACCESS_MINISAT, ACCESS_RC_ANNOUNCE, ACCESS_BRIG_ENTRANCE, ACCESS_TCOMMS, ACCESS_TECH_STORAGE)
	minimal_wildcard_access = list(ACCESS_CE)
	config_job = "chief_engineer"
	template_access = list(ACCESS_CAPTAIN, ACCESS_CHANGE_IDS)
	job = /datum/job/chief_engineer

/datum/id_trim/job/chief_medical_officer
	assignment = "Chiron Biolab Overseer"
	intern_alt_name = "Chief Medical Officer-in-Training"
	trim_state = "trim_medicaldoctor"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_MEDICAL_BLUE
	department_state = "departmenthead"
	sechud_icon_state = SECHUD_CHIEF_MEDICAL_OFFICER
	extra_access = list(ACCESS_TELEPORTER)
	extra_wildcard_access = list()
	minimal_access = list(ACCESS_PLUMBING, ACCESS_EVA, ACCESS_COMMAND, ACCESS_KEYCARD_AUTH, ACCESS_MAINT_TUNNELS, ACCESS_MECH_MEDICAL,
					ACCESS_MEDICAL, ACCESS_MINERAL_STOREROOM, ACCESS_MORGUE, ACCESS_PHARMACY, ACCESS_PSYCHOLOGY, ACCESS_RC_ANNOUNCE,
					ACCESS_BRIG_ENTRANCE, ACCESS_SURGERY, ACCESS_VIROLOGY)
	minimal_wildcard_access = list(ACCESS_CMO)
	config_job = "chief_medical_officer"
	template_access = list(ACCESS_CAPTAIN, ACCESS_CHANGE_IDS)
	job = /datum/job/chief_medical_officer

/datum/id_trim/job/clown
	assignment = "Clown"
	trim_state = "trim_clown"
	department_color = COLOR_MAGENTA
	subdepartment_color = COLOR_MAGENTA
	sechud_icon_state = SECHUD_CLOWN
	extra_access = list()
	minimal_access = list(ACCESS_THEATRE, ACCESS_SERVICE)
	config_job = "clown"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_CHANGE_IDS)
	job = /datum/job/clown

/datum/id_trim/job/cook
	assignment = "Cook"
	trim_state = "trim_cook"
	department_color = COLOR_SERVICE_LIME
	subdepartment_color = COLOR_SERVICE_LIME
	sechud_icon_state = SECHUD_COOK
	extra_access = list(ACCESS_BAR, ACCESS_HYDROPONICS)
	minimal_access = list(ACCESS_KITCHEN, ACCESS_MINERAL_STOREROOM, ACCESS_MORGUE, ACCESS_SERVICE)
	config_job = "cook"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_CHANGE_IDS)
	job = /datum/job/cook

/datum/id_trim/job/cook/chef
	assignment = "Chef"
	sechud_icon_state = SECHUD_CHEF

/datum/id_trim/job/curator
	assignment = "Curator"
	trim_state = "trim_curator"
	department_color = COLOR_SERVICE_LIME
	subdepartment_color = COLOR_SERVICE_LIME
	sechud_icon_state = SECHUD_CURATOR
	extra_access = list()
	minimal_access = list(ACCESS_AUX_BASE, ACCESS_LIBRARY, ACCESS_SALVAGECREW_STATION, ACCESS_SERVICE)
	config_job = "curator"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_CHANGE_IDS)
	job = /datum/job/curator

/datum/id_trim/job/detective
	assignment = "Detective"
	trim_state = "trim_detective"
	department_color = COLOR_SECURITY_RED
	subdepartment_color = COLOR_SECURITY_RED
	sechud_icon_state = SECHUD_DETECTIVE
	extra_access = list()
	minimal_access = list(ACCESS_BRIG, ACCESS_COURT, ACCESS_DETECTIVE, ACCESS_BRIG_ENTRANCE,ACCESS_MAINT_TUNNELS, ACCESS_MORGUE,
					ACCESS_MECH_SECURITY, ACCESS_MINERAL_STOREROOM, ACCESS_WEAPONS)
	config_job = "detective"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOS, ACCESS_CHANGE_IDS)
	job = /datum/job/detective

/datum/id_trim/job/detective/refresh_trim_access()
	. = ..()

	if(!.)
		return

	// Config check for if sec has maint access.
	if(CONFIG_GET(flag/security_has_maint_access))
		access |= list(ACCESS_MAINT_TUNNELS)

/datum/id_trim/job/geneticist
	assignment = "Geneticist"
	trim_state = "trim_geneticist"
	department_color = COLOR_SCIENCE_PINK
	subdepartment_color = COLOR_SCIENCE_PINK
	sechud_icon_state = SECHUD_GENETICIST
	extra_access = list(ACCESS_ROBOTICS, ACCESS_TECH_STORAGE, ACCESS_XENOBIOLOGY)
	minimal_access = list(ACCESS_GENETICS, ACCESS_MECH_SCIENCE, ACCESS_MINERAL_STOREROOM, ACCESS_MORGUE, ACCESS_RESEARCH, ACCESS_SCIENCE)
	config_job = "geneticist"
	template_access = list(ACCESS_CAPTAIN, ACCESS_RD, ACCESS_CHANGE_IDS)
	job = /datum/job/geneticist

/datum/id_trim/job/head_of_personnel
	assignment = "Seneschal"
	intern_alt_name = "Head of Personnel-in-Training"
	trim_state = "trim_headofpersonnel"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_SERVICE_LIME
	department_state = "departmenthead"
	sechud_icon_state = SECHUD_HEAD_OF_PERSONNEL
	extra_access = list()
	extra_wildcard_access = list()
	minimal_access = list(ACCESS_AI_UPLOAD, ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_AUX_BASE, ACCESS_BAR, ACCESS_CARGO, ACCESS_CHAPEL_OFFICE,
					ACCESS_CHANGE_IDS, ACCESS_CONSTRUCTION, ACCESS_COURT, ACCESS_CREMATORIUM, ACCESS_ENGINEERING, ACCESS_EVA, ACCESS_GATEWAY,
					ACCESS_COMMAND, ACCESS_HYDROPONICS, ACCESS_JANITOR, ACCESS_KEYCARD_AUTH, ACCESS_KITCHEN, ACCESS_LAWYER, ACCESS_LIBRARY,
					ACCESS_MAIL_SORTING, ACCESS_MAINT_TUNNELS, ACCESS_MECH_MINING, ACCESS_MEDICAL, ACCESS_MINERAL_STOREROOM,
					ACCESS_SALVAGECREW, ACCESS_SALVAGECREW_STATION, ACCESS_MORGUE, ACCESS_PSYCHOLOGY, ACCESS_QM, ACCESS_RC_ANNOUNCE,
					ACCESS_RESEARCH, ACCESS_BRIG_ENTRANCE, ACCESS_TELEPORTER, ACCESS_THEATRE, ACCESS_VAULT, ACCESS_WEAPONS, ACCESS_SERVICE)
	minimal_wildcard_access = list(ACCESS_HOP)
	config_job = "head_of_personnel"
	template_access = list(ACCESS_CAPTAIN, ACCESS_CHANGE_IDS)
	job = /datum/job/head_of_personnel

/datum/id_trim/job/head_of_security
	assignment = "Justiciar"
	intern_alt_name = "Head of Security-in-Training"
	trim_state = "trim_securityofficer"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_SECURITY_RED
	department_state = "departmenthead"
	sechud_icon_state = SECHUD_HEAD_OF_SECURITY
	extra_access = list(ACCESS_TELEPORTER)
	extra_wildcard_access = list()
	minimal_access = list(ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_ARMORY, ACCESS_AUX_BASE, ACCESS_BRIG, ACCESS_CONSTRUCTION, ACCESS_COURT,
					ACCESS_ENGINEERING, ACCESS_EVA, ACCESS_DETECTIVE, ACCESS_GATEWAY, ACCESS_COMMAND, ACCESS_KEYCARD_AUTH,
					ACCESS_MAIL_SORTING, ACCESS_MAINT_TUNNELS, ACCESS_MECH_SECURITY, ACCESS_MEDICAL, ACCESS_MINERAL_STOREROOM,
					ACCESS_SALVAGECREW, ACCESS_MORGUE, ACCESS_RC_ANNOUNCE, ACCESS_RESEARCH, ACCESS_SECURITY, ACCESS_BRIG_ENTRANCE, ACCESS_WEAPONS)
	minimal_wildcard_access = list(ACCESS_HOS)
	config_job = "head_of_security"
	template_access = list(ACCESS_CAPTAIN, ACCESS_CHANGE_IDS)
	job = /datum/job/head_of_security

/datum/id_trim/job/head_of_security/refresh_trim_access()
	. = ..()

	if(!.)
		return

	// Config check for if sec has maint access.
	if(CONFIG_GET(flag/security_has_maint_access))
		access |= list(ACCESS_MAINT_TUNNELS)

/datum/id_trim/job/janitor
	assignment = "Janitor"
	trim_state = "trim_janitor"
	department_color = COLOR_SERVICE_LIME
	subdepartment_color = COLOR_SERVICE_LIME
	sechud_icon_state = SECHUD_JANITOR
	extra_access = list()
	minimal_access = list(ACCESS_JANITOR, ACCESS_MAINT_TUNNELS, ACCESS_MINERAL_STOREROOM, ACCESS_SERVICE)
	config_job = "janitor"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_CHANGE_IDS)
	job = /datum/job/janitor

/datum/id_trim/job/lawyer
	assignment = "Lawyer"
	trim_state = "trim_lawyer"
	department_color = COLOR_SERVICE_LIME
	subdepartment_color = COLOR_SECURITY_RED
	sechud_icon_state = SECHUD_LAWYER
	extra_access = list()
	minimal_access = list(ACCESS_COURT, ACCESS_LAWYER, ACCESS_BRIG_ENTRANCE, ACCESS_SERVICE)
	config_job = "lawyer"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_HOS, ACCESS_CHANGE_IDS)
	job = /datum/job/lawyer

/datum/id_trim/job/medical_doctor
	assignment = "Medical Doctor"
	trim_state = "trim_medicaldoctor"
	department_color = COLOR_MEDICAL_BLUE
	subdepartment_color = COLOR_MEDICAL_BLUE
	sechud_icon_state = SECHUD_MEDICAL_DOCTOR
	extra_access = list(ACCESS_PLUMBING, ACCESS_VIROLOGY)
	minimal_access = list(ACCESS_MECH_MEDICAL, ACCESS_MEDICAL, ACCESS_MINERAL_STOREROOM, ACCESS_MORGUE, ACCESS_PHARMACY, ACCESS_SURGERY)
	config_job = "medical_doctor"
	template_access = list(ACCESS_CAPTAIN, ACCESS_CMO, ACCESS_CHANGE_IDS)
	job = /datum/job/doctor

/datum/id_trim/job/mime
	assignment = "Mime"
	trim_state = "trim_mime"
	department_color = COLOR_SILVER
	subdepartment_color = COLOR_WHITE
	sechud_icon_state = SECHUD_MIME
	extra_access = list()
	minimal_access = list(ACCESS_THEATRE, ACCESS_SERVICE)
	config_job = "mime"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_CHANGE_IDS)
	job = /datum/job/mime

/datum/id_trim/job/paramedic
	assignment = "Paramedic"
	trim_state = "trim_paramedic"
	department_color = COLOR_MEDICAL_BLUE
	subdepartment_color = COLOR_MEDICAL_BLUE
	sechud_icon_state = SECHUD_PARAMEDIC
	extra_access = list(ACCESS_SURGERY)
	minimal_access = list(ACCESS_CONSTRUCTION, ACCESS_HYDROPONICS, ACCESS_MAINT_TUNNELS, ACCESS_MECH_MEDICAL,
					ACCESS_MEDICAL, ACCESS_MINERAL_STOREROOM, ACCESS_SALVAGECREW, ACCESS_MORGUE, ACCESS_RESEARCH)
	config_job = "paramedic"
	template_access = list(ACCESS_CAPTAIN, ACCESS_CMO, ACCESS_CHANGE_IDS)
	job = /datum/job/paramedic

/datum/id_trim/job/prisoner
	assignment = "Prisoner"
	trim_state = "trim_warden"
	department_color = COLOR_PRISONER_BLACK
	subdepartment_color = COLOR_PRISONER_ORANGE
	sechud_icon_state = SECHUD_PRISONER
	config_job = "prisoner"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_HOS, ACCESS_CHANGE_IDS)
	job = /datum/job/prisoner

/datum/id_trim/job/prisoner/one
	trim_state = "trim_prisoner_1"
	template_access = null

/datum/id_trim/job/prisoner/two
	trim_state = "trim_prisoner_2"
	template_access = null

/datum/id_trim/job/prisoner/three
	trim_state = "trim_prisoner_3"
	template_access = null

/datum/id_trim/job/prisoner/four
	trim_state = "trim_prisoner_4"
	template_access = null

/datum/id_trim/job/prisoner/five
	trim_state = "trim_prisoner_5"
	template_access = null

/datum/id_trim/job/prisoner/six
	trim_state = "trim_prisoner_6"
	template_access = null

/datum/id_trim/job/prisoner/seven
	trim_state = "trim_prisoner_7"
	template_access = null

/datum/id_trim/job/psychologist
	assignment = "Psychologist"
	trim_state = "trim_psychologist"
	department_color = COLOR_SERVICE_LIME
	subdepartment_color = COLOR_MEDICAL_BLUE
	sechud_icon_state = SECHUD_PSYCHOLOGIST
	extra_access = list()
	minimal_access = list(ACCESS_MEDICAL, ACCESS_PSYCHOLOGY, ACCESS_SERVICE)
	config_job = "psychologist"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_CMO, ACCESS_CHANGE_IDS)
	job = /datum/job/psychologist

/datum/id_trim/job/quartermaster
	assignment = "Quartermaster"
	trim_state = "trim_quartermaster"
	department_color = COLOR_CARGO_BROWN
	subdepartment_color = COLOR_CARGO_BROWN
	department_state = "departmenthead" // Lol
	sechud_icon_state = SECHUD_QUARTERMASTER
	extra_access = list()
	minimal_access = list(ACCESS_AUX_BASE, ACCESS_CARGO, ACCESS_MAIL_SORTING, ACCESS_MAINT_TUNNELS, ACCESS_MECH_MINING, ACCESS_SALVAGECREW_STATION,
					ACCESS_MINERAL_STOREROOM, ACCESS_SALVAGECREW, ACCESS_QM, ACCESS_RC_ANNOUNCE, ACCESS_VAULT)
	config_job = "quartermaster"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_CHANGE_IDS)
	job = /datum/job/quartermaster

/datum/id_trim/job/research_director
	assignment = "Chiron Research Overseer"
	intern_alt_name = "Research Director-in-Training"
	trim_state = "trim_scientist"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_SCIENCE_PINK
	department_state = "departmenthead"
	sechud_icon_state = SECHUD_RESEARCH_DIRECTOR
	extra_access = list()
	extra_wildcard_access = list()
	minimal_access = list(ACCESS_AI_UPLOAD, ACCESS_AUX_BASE, ACCESS_EVA, ACCESS_GATEWAY, ACCESS_GENETICS, ACCESS_COMMAND, ACCESS_KEYCARD_AUTH,
					ACCESS_NETWORK, ACCESS_MAINT_TUNNELS, ACCESS_MECH_ENGINE, ACCESS_MECH_MINING, ACCESS_MECH_SECURITY, ACCESS_MECH_SCIENCE,
					ACCESS_MEDICAL, ACCESS_MINERAL_STOREROOM, ACCESS_SALVAGECREW, ACCESS_SALVAGECREW_STATION, ACCESS_MINISAT, ACCESS_MORGUE,
					ACCESS_ORDNANCE, ACCESS_ORDNANCE_STORAGE, ACCESS_RC_ANNOUNCE, ACCESS_RESEARCH, ACCESS_SCIENCE, ACCESS_ROBOTICS,
					ACCESS_BRIG_ENTRANCE, ACCESS_TECH_STORAGE, ACCESS_TELEPORTER, ACCESS_XENOBIOLOGY)
	minimal_wildcard_access = list(ACCESS_RD)
	config_job = "research_director"
	template_access = list(ACCESS_CAPTAIN, ACCESS_CHANGE_IDS)
	job = /datum/job/research_director

/datum/id_trim/job/roboticist
	assignment = "Roboticist"
	trim_state = "trim_roboticist"
	department_color = COLOR_SCIENCE_PINK
	subdepartment_color = COLOR_SCIENCE_PINK
	sechud_icon_state = SECHUD_ROBOTICIST
	extra_access = list(ACCESS_GENETICS, ACCESS_ORDNANCE, ACCESS_ORDNANCE_STORAGE, ACCESS_XENOBIOLOGY)
	minimal_access = list(ACCESS_AUX_BASE, ACCESS_MECH_SCIENCE, ACCESS_MINERAL_STOREROOM, ACCESS_MORGUE, ACCESS_RESEARCH, ACCESS_SCIENCE,
					ACCESS_ROBOTICS, ACCESS_TECH_STORAGE)
	config_job = "roboticist"
	template_access = list(ACCESS_CAPTAIN, ACCESS_RD, ACCESS_CHANGE_IDS)
	job = /datum/job/roboticist

/datum/id_trim/job/scientist
	assignment = "Scientist"
	trim_state = "trim_scientist"
	department_color = COLOR_SCIENCE_PINK
	subdepartment_color = COLOR_SCIENCE_PINK
	sechud_icon_state = SECHUD_SCIENTIST
	extra_access = list(ACCESS_GENETICS, ACCESS_ROBOTICS)
	minimal_access = list(ACCESS_AUX_BASE, ACCESS_MECH_SCIENCE, ACCESS_MINERAL_STOREROOM, ACCESS_ORDNANCE, ACCESS_ORDNANCE_STORAGE,
					ACCESS_RESEARCH, ACCESS_SCIENCE, ACCESS_XENOBIOLOGY)
	config_job = "scientist"
	template_access = list(ACCESS_CAPTAIN, ACCESS_RD, ACCESS_CHANGE_IDS)
	job = /datum/job/scientist

/// Sec officers have departmental variants. They each have their own trims with bonus departmental accesses.
/datum/id_trim/job/security_officer
	assignment = "Security Officer"
	trim_state = "trim_securityofficer"
	department_color = COLOR_SECURITY_RED
	subdepartment_color = COLOR_SECURITY_RED
	sechud_icon_state = SECHUD_SECURITY_OFFICER
	extra_access = list(ACCESS_DETECTIVE, ACCESS_MAINT_TUNNELS, ACCESS_MORGUE)
	minimal_access = list(ACCESS_BRIG, ACCESS_COURT, ACCESS_SECURITY, ACCESS_BRIG_ENTRANCE, ACCESS_MECH_SECURITY,
					ACCESS_MINERAL_STOREROOM, ACCESS_WEAPONS)
	/// List of bonus departmental accesses that departmental sec officers get.
	var/department_access = list()
	config_job = "security_officer"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOS, ACCESS_CHANGE_IDS)
	job = /datum/job/security_officer

/datum/id_trim/job/security_officer/refresh_trim_access()
	. = ..()

	if(!.)
		return

	// Config check for if sec has maint access.
	if(CONFIG_GET(flag/security_has_maint_access))
		access |= list(ACCESS_MAINT_TUNNELS)

	access |= department_access

/datum/id_trim/job/security_officer/supply
	assignment = "Security Officer (Cargo)"
	subdepartment_color = COLOR_CARGO_BROWN
	department_access = list(ACCESS_AUX_BASE, ACCESS_CARGO, ACCESS_MAIL_SORTING, ACCESS_SALVAGECREW, ACCESS_SALVAGECREW_STATION)

/datum/id_trim/job/security_officer/engineering
	assignment = "Security Officer (Engineering)"
	subdepartment_color = COLOR_ENGINEERING_ORANGE
	department_access = list(ACCESS_ATMOSPHERICS, ACCESS_AUX_BASE, ACCESS_CONSTRUCTION, ACCESS_ENGINEERING)

/datum/id_trim/job/security_officer/medical
	assignment = "Security Officer (Medical)"
	subdepartment_color = COLOR_MEDICAL_BLUE
	department_access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY)

/datum/id_trim/job/security_officer/science
	assignment = "Security Officer (Science)"
	subdepartment_color = COLOR_SCIENCE_PINK
	department_access = list(ACCESS_AUX_BASE, ACCESS_RESEARCH, ACCESS_SCIENCE)

/datum/id_trim/job/salvage_crew
	assignment = "Salvage Crew"
	trim_state = "trim_salvagecrew"
	department_color = COLOR_CARGO_BROWN
	subdepartment_color = COLOR_SCIENCE_PINK
	sechud_icon_state = SECHUD_SALVAGE_CREW
	extra_access = list(ACCESS_CARGO, ACCESS_MAINT_TUNNELS, ACCESS_QM)
	minimal_access = list(ACCESS_AUX_BASE, ACCESS_MAIL_SORTING, ACCESS_MECH_MINING, ACCESS_MINERAL_STOREROOM, ACCESS_SALVAGECREW,
					ACCESS_SALVAGECREW_STATION)
	config_job = "salvage_crew"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOP, ACCESS_CHANGE_IDS)
	job = /datum/job/salvage_crew

/// ID card obtained from the mining Disney dollar points vending machine.
/datum/id_trim/job/salvage_crew/spare
	extra_access = list()
	minimal_access = list(ACCESS_MAIL_SORTING, ACCESS_MECH_MINING, ACCESS_MINERAL_STOREROOM, ACCESS_SALVAGECREW, ACCESS_SALVAGECREW_STATION)
	template_access = null

/datum/id_trim/job/station_engineer
	assignment = "Station Engineer"
	trim_state = "trim_stationengineer"
	department_color = COLOR_ENGINEERING_ORANGE
	subdepartment_color = COLOR_ENGINEERING_ORANGE
	sechud_icon_state = SECHUD_STATION_ENGINEER
	extra_access = list(ACCESS_ATMOSPHERICS)
	minimal_access = list(ACCESS_AUX_BASE, ACCESS_CONSTRUCTION, ACCESS_ENGINEERING, ACCESS_ENGINE_EQUIP, ACCESS_EXTERNAL_AIRLOCKS,
					ACCESS_MAINT_TUNNELS, ACCESS_MECH_ENGINE, ACCESS_MINERAL_STOREROOM, ACCESS_TCOMMS, ACCESS_TECH_STORAGE)
	config_job = "station_engineer"
	template_access = list(ACCESS_CAPTAIN, ACCESS_CE, ACCESS_CHANGE_IDS)
	job = /datum/job/station_engineer

/datum/id_trim/job/virologist
	assignment = "Virologist"
	trim_state = "trim_virologist"
	department_color = COLOR_MEDICAL_BLUE
	subdepartment_color = COLOR_MEDICAL_BLUE
	sechud_icon_state = SECHUD_VIROLOGIST
	extra_access = list(ACCESS_PLUMBING, ACCESS_MORGUE, ACCESS_SURGERY)
	minimal_access = list(ACCESS_MEDICAL, ACCESS_MECH_MEDICAL, ACCESS_MINERAL_STOREROOM, ACCESS_VIROLOGY)
	config_job = "virologist"
	template_access = list(ACCESS_CAPTAIN, ACCESS_CMO, ACCESS_CHANGE_IDS)
	job = /datum/job/virologist

/datum/id_trim/job/warden
	assignment = "Warden"
	trim_state = "trim_warden"
	department_color = COLOR_SECURITY_RED
	subdepartment_color = COLOR_SECURITY_RED
	sechud_icon_state = SECHUD_WARDEN
	extra_access = list(ACCESS_DETECTIVE, ACCESS_MAINT_TUNNELS, ACCESS_MORGUE)
	minimal_access = list(ACCESS_ARMORY, ACCESS_BRIG, ACCESS_COURT, ACCESS_MECH_SECURITY, ACCESS_MINERAL_STOREROOM,
					ACCESS_SECURITY, ACCESS_BRIG_ENTRANCE, ACCESS_WEAPONS) // See /datum/job/warden/get_access()
	config_job = "warden"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOS, ACCESS_CHANGE_IDS)
	job = /datum/job/warden

/datum/id_trim/job/warden/refresh_trim_access()
	. = ..()

	if(!.)
		return

	// Config check for if sec has maint access.
	if(CONFIG_GET(flag/security_has_maint_access))
		access |= list(ACCESS_MAINT_TUNNELS)
