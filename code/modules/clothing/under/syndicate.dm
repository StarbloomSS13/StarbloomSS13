/obj/item/clothing/under/syndicate
	name = "tactical turtleneck"
	desc = "A non-descript and slightly suspicious looking turtleneck with digital camouflage cargo pants."
	icon_state = "syndicate"
	inhand_icon_state = "bl_suit"
	has_sensor = NO_SENSORS
	armor = list(MELEE = 10, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 50, ACID = 40)
	alt_covers_chest = TRUE
	icon = 'icons/obj/clothing/under/syndicate.dmi'
	worn_icon = 'icons/mob/clothing/under/syndicate.dmi'

/obj/item/clothing/under/syndicate/skirt
	name = "tactical skirtleneck"
	desc = "A non-descript and slightly suspicious looking skirtleneck."
	icon_state = "syndicate_skirt"
	inhand_icon_state = "bl_suit"
	has_sensor = NO_SENSORS
	armor = list(MELEE = 10, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 50, ACID = 40)
	alt_covers_chest = TRUE
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	dying_key = DYE_REGISTRY_JUMPSKIRT
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/syndicate/crew
	name = "non-tactical turtleneck"
	desc = "A normal looking turtleneck with cargo pants. Its tacticool operator magic appears not to be present."
	icon_state = "syndicate"
	inhand_icon_state = "bl_suit"
	has_sensor = HAS_SENSORS
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)
	alt_covers_chest = TRUE
	icon = 'icons/obj/clothing/under/syndicate.dmi'
	worn_icon = 'icons/mob/clothing/under/syndicate.dmi'

/obj/item/clothing/under/syndicate/edict // TODO: Repath /syndicate/ to /tactical/
	desc = "A non-descript and slightly suspicious looking turtleneck with pitch-black cargo pants."
	icon_state = "tactical_turtleneck"

	greyscale_config = /datum/greyscale_config/tactical_turtleneck

	greyscale_config_worn = /datum/greyscale_config/tactical_turtleneck_worn

	greyscale_colors = "#61466A#00FF21"

/obj/item/clothing/under/syndicate/edict/skirts
	desc = "A non-descript and slightly suspicious looking skirtleneck with pitch-black cargo pants."
	icon_state = "tactical_skirtleneck"

/obj/item/clothing/under/syndicate/bloodred
	name = "purple sneaksuit"
	desc = "It still counts as stealth if there are no witnesses."
	icon_state = "bloodred_pajamas"
	inhand_icon_state = "bl_suit"
	armor = list(MELEE = 10, BULLET = 10, LASER = 10,ENERGY = 10, BOMB = 0, BIO = 0, FIRE = 50, ACID = 40)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	can_adjust = FALSE

/obj/item/clothing/under/syndicate/bloodred/sleepytime
	name = "purple pajamas"
	desc = "Does the last edict dream of wild sheep?"
	icon_state = "bloodred_pajamas"
	inhand_icon_state = "bl_suit"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 50, ACID = 40)

/obj/item/clothing/under/syndicate/tacticool
	name = "tacticool turtleneck"
	desc = "Just looking at it makes you want to buy an SKS, go into the woods, and -operate-."
	icon_state = "tactifool"
	inhand_icon_state = "bl_suit"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 50, ACID = 40)

/obj/item/clothing/under/syndicate/tacticool/skirt
	name = "tacticool skirtleneck"
	desc = "Just looking at it makes you want to buy an SKS, go into the woods, and -operate-."
	icon_state = "tactifool_skirt"
	inhand_icon_state = "bl_suit"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 50, ACID = 40)
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	dying_key = DYE_REGISTRY_JUMPSKIRT
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/syndicate/sniper
	name = "tactical turtleneck suit"
	desc = "A double seamed tactical turtleneck disguised as a civilian grade silk suit. Intended for the most formal operator. The collar is really sharp."
	icon_state = "tactical_suit"
	inhand_icon_state = "bl_suit"
	can_adjust = FALSE

/obj/item/clothing/under/syndicate/camo
	name = "camouflage fatigues"
	desc = "A green military camouflage uniform."
	icon_state = "camogreen"
	inhand_icon_state = "g_suit"
	can_adjust = FALSE

/obj/item/clothing/under/syndicate/soviet
	name = "Ratnik 5 tracksuit"
	desc = "Badly translated labels tell you to clean this in Vodka. Great for squatting in."
	icon_state = "trackpants"
	can_adjust = FALSE
	armor = list(MELEE = 10, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)
	resistance_flags = NONE

/obj/item/clothing/under/syndicate/combat
	name = "combat uniform"
	desc = "With a suit lined with this many pockets, you are ready to operate."
	icon_state = "syndicate_combat"
	can_adjust = FALSE

/obj/item/clothing/under/syndicate/rus_army
	name = "advanced military tracksuit"
	desc = "Military grade tracksuits for frontline squatting."
	icon_state = "rus_under"
	can_adjust = FALSE
	armor = list(MELEE = 5, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)
	resistance_flags = NONE
