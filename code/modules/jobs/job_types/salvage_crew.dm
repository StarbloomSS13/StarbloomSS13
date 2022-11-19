/datum/job/salvage_crew
	title = JOB_SALVAGE_CREW
	description = "Travel to nearby derelict ships. \
	Scrap them for parts and materials. Accidentally forget \
	to decontaminate. Get cremated."
	department_head = list(JOB_HEAD_OF_PERSONNEL)
	faction = FACTION_STATION
	total_positions = 3
	spawn_positions = 3
	supervisors = "the quartermaster and the seneschal"
	selection_color = "#dcba97"
	exp_granted_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/salvage_crew
	plasmaman_outfit = /datum/outfit/plasmaman/salvage_crew

	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_SALVAGE_CREW
	bounty_types = CIV_JOB_SALVAGE
	departments_list = list(
		/datum/job_department/cargo,
		)

	family_heirlooms = list(/obj/item/pickaxe/mini, /obj/item/shovel)
	rpg_title = "Adventurer"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN


/datum/outfit/job/salvage_crew
	name = "Salvage Crew"
	jobtype = /datum/job/salvage_crew

	id_trim = /datum/id_trim/job/salvage_crew
	uniform = /obj/item/clothing/under/rank/cargo/salvagecrew
	backpack_contents = list(
		/obj/item/flashlight/seclite = 1,
		/obj/item/knife/combat/survival = 1,
		/obj/item/mining_voucher = 1,
		/obj/item/stack/marker_beacon/ten = 1,
		)
	belt = /obj/item/pda/salvagecrew
	ears = /obj/item/radio/headset/headset_cargo/salvagecrew
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/workboots/salvage
	l_pocket = /obj/item/reagent_containers/hypospray/medipen/survival
	r_pocket = /obj/item/storage/bag/ore //causes issues if spawned in backpack

	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	duffelbag = /obj/item/storage/backpack/duffelbag/explorer

	box = /obj/item/storage/box/survival/mining
	chameleon_extras = /obj/item/gun/energy/plasmacutter
	skillchips = list(/obj/item/skillchip/job/off_z_pain_resistance)

/datum/outfit/job/salvage_crew/equipped
	name = "Salvage Crew (Equipment)"

	suit = /obj/item/clothing/suit/hooded/explorer
	suit_store = /obj/item/tank/internals/oxygen
	backpack_contents = list(
		/obj/item/flashlight/seclite = 1,
		/obj/item/gun/energy/plasmacutter = 1,
		/obj/item/knife/combat/survival = 1,
		/obj/item/mining_voucher = 1,
		/obj/item/stack/marker_beacon/ten = 1,
		/obj/item/t_scanner/adv_mining_scanner/lesser = 1,
		)
	mask = /obj/item/clothing/mask/gas/explorer
	internals_slot = ITEM_SLOT_SUITSTORE

/datum/outfit/job/salvage_crew/equipped/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(istype(H.wear_suit, /obj/item/clothing/suit/hooded))
		var/obj/item/clothing/suit/hooded/S = H.wear_suit
		S.ToggleHood()

/datum/outfit/job/salvage_crew/equipped/mod
	name = "Salvage Crew (Equipment + MODsuit)"
	back = /obj/item/mod/control/pre_equipped/salvage
	suit = null
	mask = /obj/item/clothing/mask/gas/explorer
