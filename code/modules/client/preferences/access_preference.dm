#define NO_EXTRA_ACCESS -1
#define NO_EXTRA_ACCESS_KEY "No Extra Access"

/// Allowss you to make a preference for starting with additional roundstart access
/// Contains a smidge of hackery to function before SSid_access is instantiated
/datum/preference/choiced/access

	abstract_type = /datum/preference/choiced/access

	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	can_randomize = FALSE
	randomize_by_default = FALSE

	/**
	 * We display access in the form of keys to the end user, so they can actually understand what they're selecting
	 * However we need to map the keys to what access they're actually awarded with via a list
	 *
	 * NOTE: IF (FOR SOME REASON) YOU'RE ADDING A PREFERENCE FOR ACCESS NOT FOUND IN REGION_ACCESS_ALL_GLOBAL
	 * YOU WILL NEED TO OVERRIDE DESERIALIZE(). We validate our access against that list.
	 *
	 * Example: list("Real Captain" = ACCESS_CAPTAIN, "Bridge Access" = ACCESS_HEADS, "Secretly a Cultist" = ACCESS_BLOODCULT)
	 */
	var/list/keys_to_access = list()

/datum/preference/choiced/access/New()
	. = ..()
	// All keys_to_access lists should have this in it, as it's the default
	keys_to_access[NO_EXTRA_ACCESS_KEY] = NO_EXTRA_ACCESS

// Our values consist of all keys in the keys_to_access list
/datum/preference/choiced/access/init_possible_values()
	SHOULD_NOT_OVERRIDE(TRUE)
	return assoc_to_keys(keys_to_access)

// By default, add no access. Duh
/datum/preference/choiced/access/create_default_value()
	SHOULD_NOT_OVERRIDE(TRUE)
	return NO_EXTRA_ACCESS_KEY

// We don't equip the access here, we do it in equip_outfit_and_loadout().
/datum/preference/choiced/access/apply_to_human(mob/living/carbon/human/target, value)
	return

/datum/preference/choiced/access/is_accessible(datum/preferences/preferences)
	. = ..()
	if(!.)
		return FALSE

	// If their top job is one of the few jobs that don't have ID cards / are above the concept of access..
	var/static/list/jobs_without_access = list(/datum/job/ai, /datum/job/cyborg, /datum/job/captain)
	// ... don't bother showing them the preference for added access, since they won't benefit
	return !is_type_in_list(preferences.get_highest_priority_job(), jobs_without_access)

/datum/preference/choiced/access/deserialize(input, datum/preferences/preferences)
	// Sanitize that the key is in the list of keys_to_access
	// If it's not in the list, revert to NO_EXTRA_ACCESS_KEY
	var/default = create_default_value()
	var/key = sanitize_inlist(input, get_choices(), default)
	// We got defaulted anyways, we don't need to continue
	if(key == default)
		return default

	// Yes this'll be very unperformant while SSid_access is not init-ed, unfortunately
	var/list/list_of_all_access_in_existence = SSid_access.initialized ? SSid_access.accesses_by_region[REGION_ALL_GLOBAL] : REGION_ACCESS_ALL_GLOBAL
	// Our access seems legit, let's validate that it's an actual access now
	// Are we found in the list of all accesses? We're good!
	if(keys_to_access[key] in list_of_all_access_in_existence)
		return key

	// Welp, our access isn't in the list of all accesses, just use the default
	return default

/// A proc to give all the preference access from a preference source to this mob.
/mob/living/carbon/human/proc/equip_preference_access(datum/preferences/preference_source)
	var/obj/item/card/id/advanced/their_id = locate() in get_all_contents()
	if(!their_id)
		return

	var/list/bonus_access_to_give = list()
	for(var/preference_type in GLOB.preference_entries)
		if(!ispath(preference_type, /datum/preference/choiced/access))
			continue

		var/access_key_found = preference_source.read_preference(preference_type)
		if(!access_key_found || access_key_found == NO_EXTRA_ACCESS_KEY)
			continue

		var/datum/preference/choiced/access/access_preference = GLOB.preference_entries[preference_type]
		bonus_access_to_give |= access_preference.keys_to_access[access_key_found]

	if(!length(bonus_access_to_give))
		return

	their_id.add_access(list(bonus_access_to_give), mode = FORCE_ADD_ALL)

/*

Here's a sample "access preference" for example purposes.
Remember that, when adding new preferences, you also need to add a corresponding `.tsx` file
(Which is usually 5 or 6 lines).

/datum/preference/choiced/access/bonus_access
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "bonus_access"
	keys_to_access = list("Free Captain Access" = ACCESS_CAPTAIN)

*/

/datum/preference/choiced/access/bonus_access
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "bonus_access"
	keys_to_access = list("The Unity" = ACCESS_UNITY, "The Home Guard Reserve" = ACCESS_HOME_GUARD, "Mekhane" = ACCESS_MEKHANE, "Conservators" = ACCESS_CONSERVATORS, "Chiron Biolabs" = ACCESS_CHIRON_BIOLABS)

#undef NO_EXTRA_ACCESS
#undef NO_EXTRA_ACCESS_KEY
