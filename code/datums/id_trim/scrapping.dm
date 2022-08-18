/// Spare Captain ID for the Rimworld Salvage Mission. Contains ALL Away access.
/datum/id_trim/away/old/rimworld/captain
	access = list(ACCESS_AWAY_GENERAL, \
		ACCESS_AWAY_COMMAND, \
		ACCESS_AWAY_SEC, \
		ACCESS_AWAY_ENGINEERING, \
		ACCESS_AWAY_MEDICAL, \
		ACCESS_AWAY_SUPPLY, \
		ACCESS_AWAY_SCIENCE, \
		ACCESS_AWAY_MAINTENANCE, \
		ACCESS_AWAY_GENERIC1, \
		ACCESS_AWAY_GENERIC2, \
		ACCESS_AWAY_GENERIC3, \
		ACCESS_AWAY_GENERIC4, \
		)
	assignment = "HP-13 Captain"

/// Spare Security Officer ID for the Rimworld Salvage Mission.
/datum/id_trim/away/old/rimworld/security_officer_med
	access = list(ACCESS_AWAY_SEC, \
		ACCESS_AWAY_MEDICAL, \
		ACCESS_AWAY_MAINTENANCE, \
		)
	assignment = "HP-13 Security Officer (Medical)"

/// Spare Engineer ID Card for the Rimworld Salvage Mission.
/datum/id_trim/away/old/rimworld/engineer
	access = list(ACCESS_AWAY_ENGINEERING, \
		ACCESS_AWAY_MAINTENANCE, \
		)
	assignment = "HP-13 Engineer"

/// Spare Scientist ID Card for the Rimworld Salvage Mission.
/datum/id_trim/away/old/rimworld/scientist
	access = list(ACCESS_AWAY_SCIENCE, \
		ACCESS_AWAY_MAINTENANCE, \
		)
	assignment = "HP-13 Researcher"

/// Spare Cargo Technician ID Card for the Rimworld Salvage Mission.
/datum/id_trim/away/old/rimworld/cargo_technician
	access = list(ACCESS_AWAY_SUPPLY, \
		ACCESS_AWAY_MAINTENANCE, \
		)
	assignment = "HP-13 Cargo Technician"
