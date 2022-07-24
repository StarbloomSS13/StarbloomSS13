/obj/machinery/vending/barbervend
	name = "Fab-O-Vend"
	desc = "It would seem it vends dyes, and other stuff to make you pretty."
	icon = 'modular_skyrat/modules/salon/icons/vendor.dmi'
	icon_state = "barbervend"
	vend_reply = "Come again!; Buy another!; Dont you love your new look?"
	refill_canister = /obj/item/vending_refill/barbervend
	products = list(
		/obj/item/reagent_containers/spray/quantum_hair_dye = 3,
		/obj/item/reagent_containers/spray/baldium = 3,
		/obj/item/reagent_containers/spray/barbers_aid = 3,
		/obj/item/dyespray = 5,
		/obj/item/hairbrush = 3,
		/obj/item/hairbrush/comb = 3,
		/obj/item/fur_dyer = 1,
	)
	premium = list(
		/obj/item/scissors = 3,
		/obj/item/reagent_containers/spray/super_barbers_aid = 3,
		/obj/item/storage/box/lipsticks = 3,
		/obj/item/lipstick/quantum = 1,
		/obj/item/razor = 1,
		/obj/item/storage/box/perfume = 1,
	)
	refill_canister = /obj/item/vending_refill/barbervend
	default_price = PAYCHECK_ASSISTANT
	extra_price = PAYCHECK_HARD
	payment_department = ACCOUNT_SRV

/obj/item/vending_refill/barbervend
	machine_name = "barber vend resupply"
	icon_state = "refill_snack" //generic item refill because there isnt one sprited yet.
