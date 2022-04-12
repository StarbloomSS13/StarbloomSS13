// Subtype of the toggle icon component (i know, ew) for GAGS items
/datum/component/toggle_icon/greyscale
	/// Config when toggled.
	var/toggled_config
	/// Worn config when toggled.
	var/toggled_config_worn

/datum/component/toggle_icon/greyscale/Initialize(toggle_noun = "buttons", config, worn_config)
	. = ..()
	if(. == COMPONENT_INCOMPATIBLE)
		return

	if(!config || !worn_config)
		stack_trace("[type] component initialized without a greyscale config / worn greyscale config!")
		return COMPONENT_INCOMPATIBLE

	src.toggled_config = config
	src.toggled_config_worn = worn_config

/datum/component/toggle_icon/greyscale/do_icon_toggle(atom/source, mob/living/user)
	. = ..()
	if(isitem(source))
		var/obj/item/item_source = source

		if(toggled)
			item_source.set_greyscale(new_config = toggled_config, new_worn_config = toggled_config_worn)
		else
			item_source.set_greyscale(new_config = initial(item_source.greyscale_config), new_worn_config = initial(item_source.greyscale_config_worn))

		item_source.update_slot_icon()

// GAGS parade uniform, because why not
/obj/item/clothing/suit/greyscale_parade
	name = "tailored parade jacket"
	desc = "No armor, all fashion, unfortunately."
	icon_state = "formal"
	inhand_icon_state = "labcoat"
	body_parts_covered = CHEST|GROIN|ARMS
	allowed = list(
		/obj/item/flashlight,
		/obj/item/lighter,
		/obj/item/storage/box/matches,
		/obj/item/modular_computer/tablet,
		/obj/item/pda,
		/obj/item/toy,
		/obj/item/stamp,
		/obj/item/pen,
		/obj/item/radio,
		/obj/item/knife,
		/obj/item/reagent_containers/food/drinks/bottle,
		/obj/item/reagent_containers/food/drinks/flask,
		/obj/item/storage/fancy/candle_box,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/assembly/flash/handheld,
		/obj/item/tank/internals/emergency_oxygen,
		/obj/item/tank/internals/plasmaman,
	)

	greyscale_colors = "#DDDDDD"
	greyscale_config = /datum/greyscale_config/parade_formal
	greyscale_config_worn = /datum/greyscale_config/parade_formal_worn
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/clothing/suit/greyscale_parade/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/toggle_icon/greyscale, "buttons", /datum/greyscale_config/parade_formal_open, /datum/greyscale_config/parade_formal_open_worn)
