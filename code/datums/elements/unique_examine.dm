#define span_readable_yellow(str) ("<font color = '#c5c900'>" + str + "</font>")

/datum/element/unique_examine
	element_flags = ELEMENT_BESPOKE|ELEMENT_DETACH
	id_arg_index = 2
	/// The special description that is triggered when desc_requirements are met. Make sure you set the correct EXAMINE_CHECK!
	var/desc = ""
	/// The requirement setting for special descriptions. See examine_defines.dm for more info.
	var/desc_requirement = EXAMINE_CHECK_NONE
	/// Optional replacement for antagonist names. Ex: Noting something due to your "Donk Co" affiliation, instead of "Syndicate" affiliation
	var/special_affiliation
	/// Everything we may want to check based on an examine check.
	/// This can be a list of JOBS, FACTIONS, SKILL CHIPS, or TRAITS, or a bitflag
	var/requirements
	/// If TRUE, those with the detective's skillchip (TRAIT_SEE_ALL_DESCRIPTIONS) will be able to see the description regardless.
	var/detective_sees_all = TRUE

/datum/element/unique_examine/Attach(
	atom/thing,
	desc,
	desc_requirement = EXAMINE_CHECK_NONE,
	requirements,
	special_affiliation,
	// hint = TRUE will give people a hint on examine there may be more info for this item.
	// You'll want to set this to FALSE if you're using multiple elements on one item
	hint = TRUE,
	// detective_sees_all = TRUE will allow those with the detective's skillchip to see it regardless of any other checks
	detective_sees_all = TRUE,
)

	. = ..()

	if(!isatom(thing) || isarea(thing))
		return ELEMENT_INCOMPATIBLE

	// Init our vars
	src.desc_requirement = desc_requirement
	src.desc = desc
	src.requirements = requirements
	src.special_affiliation = special_affiliation
	src.detective_sees_all = detective_sees_all

	// What are we doing if we don't even have a description?
	if(isnull(desc))
		stack_trace("Unique examine element attempted to attach to something without an examine text set.")
		return ELEMENT_INCOMPATIBLE

	// If we were passed a examine check that has a requirement,
	// check to make sure we have that requirement / it's formatted correctly
	switch(desc_requirement)
		if(EXAMINE_CHECK_TRAIT, EXAMINE_CHECK_SKILLCHIP, EXAMINE_CHECK_FACTION, EXAMINE_CHECK_JOB, EXAMINE_CHECK_SPECIES)
			if(!islist(requirements))
				stack_trace("Unique examine element attempted to attach to something without a proper requirements list. (Mode: [desc_requirement])")
				return ELEMENT_INCOMPATIBLE

		if(EXAMINE_CHECK_DEPARTMENT)
			if(isnull(requirements))
				stack_trace("Unique examine element attempted to attach to something without departmental bitflag. (Mode: [desc_requirement])")
				return ELEMENT_INCOMPATIBLE

		if(EXAMINE_CHECK_NONE, EXAMINE_CHECK_MINDSHIELD)
			if(!isnull(requirements))
				stack_trace("Unique examine element attached to something with requirements passed, even though it does not need any. \
					This may be a mistake, and should be corrected. (Mode: [desc_requirement])")

	// Having hint = TRUE will register a normal examine signal to give examiners a hint additional info is present
	if(hint)
		RegisterSignal(thing, COMSIG_PARENT_EXAMINE, .proc/hint_at)

	RegisterSignal(thing, COMSIG_PARENT_EXAMINE_MORE, .proc/examine)

/datum/element/unique_examine/Detach(atom/thing)
	. = ..()
	UnregisterSignal(thing, list(COMSIG_PARENT_EXAMINE, COMSIG_PARENT_EXAMINE_MORE))

/datum/element/unique_examine/proc/hint_at(datum/source, mob/examiner, list/examine_list)
	// What IS this thing anyways?
	var/thing = "thing"
	if(ismob(source))
		thing = "creature"
	if(isanimal(source))
		thing = "animal"
	if(ishuman(source))
		thing = "person"
	if(isobj(source))
		thing = "object"
	if(isgun(source))
		thing = "weapon"
	if(isclothing(source))
		thing = "clothing"
	if(ismachinery(source))
		thing = "machine"
	if(isstructure(source))
		thing = "structure"

	examine_list += span_smallnoticeital("This [thing] might have additional information if you [span_bold("examine closer")].")

/datum/element/unique_examine/proc/examine(datum/source, mob/examiner, list/examine_list)
	SIGNAL_HANDLER

	// "You note the following becuase x, y, and z."
	var/note_message

	switch(desc_requirement)
		// Will always show if set.
		if(EXAMINE_CHECK_NONE)
			note_message = "Upon further scrutiny, you note the following:"

		// Checks for a mindshield present
		if(EXAMINE_CHECK_MINDSHIELD)
			if(!HAS_TRAIT(examiner, TRAIT_MINDSHIELD))
				return

			// "Your innate loyalty to the North Star", not quite innate if they get implanted midround but y'know
			note_message = "Your [span_blue(span_bold("innate loyalty to the North Star"))] has given you insight here:"

		// Antag datum checks
		if(EXAMINE_CHECK_ANTAG)
			if(!examiner.mind)
				return

			for(var/datum/antagonist/antag_datum_type as anything in requirements)
				var/datum/antagonist/antag_datum = examiner.mind.has_antag_datum(antag_datum_type)
				if(!antag_datum)
					continue

				// "Your status as a secret agent" or "Your status as a traitor"
				note_message = "Your status as a [span_red(span_bold(special_affiliation || antag_datum.job_rank))] has given you insight here:"
				break

		// Job checks by title
		if(EXAMINE_CHECK_JOB)
			if(!examiner.mind)
				return

			var/datum/job/their_job = examiner.mind.assigned_role
			if(!(their_job.type in requirements))
				return

			// "Your training as a medical doctor"
			note_message = "Your training as a [span_bold(their_job.title)] has given you insight here:"

		// Department checks by bitflag
		if(EXAMINE_CHECK_DEPARTMENT)
			if(!examiner.mind)
				return
			// What flag do they have that fulfills our requirements?
			var/their_department = examiner.mind.assigned_role.departments_bitflags & requirements
			if(!their_department)
				return

			// "Your job in the cargo bay"
			note_message = "Your job [get_department(their_department)] has given you insight here:"

		// Standard faction checks
		if(EXAMINE_CHECK_FACTION)
			// What factions do they have that fulfills our requirements?
			var/list/required_factions = requirements & examiner.faction
			if(!length(required_factions))
				return

			// "Your affiliation with the Wizard Federation"
			note_message = "Your affiliation with [get_formatted_faction(pick(required_factions))] has given you insight here:"

		// Skillchip checks
		if(EXAMINE_CHECK_SKILLCHIP)
			if(!ishuman(examiner))
				return

			var/mob/living/carbon/human/human_examiner = examiner
			var/obj/item/organ/brain/examiner_brain = human_examiner.getorganslot(ORGAN_SLOT_BRAIN)
			if(!examiner_brain)
				return

			for(var/obj/item/skillchip/checked_skillchip as anything in examiner_brain.skillchips)
				if(!checked_skillchip.active)
					continue
				if(!(checked_skillchip.type in requirements))
					continue

				// "Your implanted K33P-TH4T-D15K skillchip"
				note_message = "Your implanted [span_readable_yellow(span_bold(checked_skillchip.name))] has given you insight here:"
				break

		// Trait checks
		if(EXAMINE_CHECK_TRAIT)
			for(var/checked_trait in requirements)
				if(HAS_TRAIT(examiner, checked_trait))
					// "A trait you have", kinda meta-y but not sure how else to prhase it
					note_message = "A [span_readable_yellow(span_bold("trait"))] you have has given you insight here:"
					break

		// Species checks
		if(EXAMINE_CHECK_SPECIES)
			if(!iscarbon(examiner))
				return

			var/mob/living/carbon/carbon_examiner = examiner
			var/datum/species/their_species = carbon_examiner.dna?.species
			if(!their_species || !(their_species.type in requirements))
				return

			note_message = "Being a [span_green(span_bold(their_species.name))] has given you insight here:"

	// Check for detective skills at the very end
	if(detective_sees_all && HAS_TRAIT(examiner, TRAIT_SEE_ALL_DESCRIPTIONS))
		note_message ||= "Your [span_red("suite of innate detective skills")] has given you insight here:"

	// Did not meet any requirements, or detective skills
	if(isnull(note_message))
		return

	examine_list += span_info("<br>[note_message]<br>[desc]")

// Formats some of the more common faction names into a more accurate string.
/datum/element/unique_examine/proc/get_formatted_faction(faction)
	var/faction_text = faction

	switch(faction)
		// Some role defined ones, usually granted by antag datums,
		// so you could alternatively just use those, but anyways
		if(ROLE_WIZARD)
			faction_text = span_hypnophrase("the Wizard Federation")
		if(ROLE_SYNDICATE)
			faction_text = span_red("the Syndicate")
		if(ROLE_ALIEN)
			faction_text = span_alien("the alien hivemind")
		if(ROLE_NINJA)
			faction_text = span_hypnophrase("the spider clan")
		if(FACTION_HERETIC)
			faction_text = span_hypnophrase("the Mansus")

		// Some other generic factions which don't have defines and really should
		if("cult")
			faction_text = span_cult("Nar'sie")
		if("pirate")
			faction_text = span_red("the Jolly Roger")
		if("plants")
			faction_text = span_green("nature")
		if("ashwalker")
			faction_text = span_red("the tendril")
		if("carp")
			faction_text = span_green("space carp")

	return span_bold(faction_text)

/// Format our department bitflag into a string.
/datum/element/unique_examine/proc/get_department(department_bitflag)
	var/department_text = "on the ship"

	if(department_bitflag & DEPARTMENT_BITFLAG_COMMAND)
		department_text = "as a member of command staff"
	else if(department_bitflag & DEPARTMENT_BITFLAG_SECURITY)
		department_text = "as a member of security force"
	else if(department_bitflag & DEPARTMENT_BITFLAG_SERVICE)
		department_text = "in the service department"
	else if(department_bitflag & DEPARTMENT_BITFLAG_CARGO)
		department_text = "in the cargo bay"
	else if(department_bitflag & DEPARTMENT_BITFLAG_ENGINEERING)
		department_text = "as one of the engineers"
	else if(department_bitflag & DEPARTMENT_BITFLAG_SCIENCE)
		department_text = "in the science team"
	else if(department_bitflag & DEPARTMENT_BITFLAG_MEDICAL)
		department_text = "in the medical field"
	else if(department_bitflag & DEPARTMENT_BITFLAG_SILICON)
		department_text = "as a silicon unit"

	return span_bold(department_text)

#undef span_readable_yellow
