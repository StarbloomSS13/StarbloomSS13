/obj/machinery/vending/coffee
	name = "\improper Solar's Best Hot Drinks"
	desc = "A vending machine which dispenses hot drinks."
	icon_state = "coffee"
	icon_vend = "coffee-vend"
	panel_type = "panel9"
	products = list(
		/obj/item/reagent_containers/food/drinks/coffee = 6,
		/obj/item/reagent_containers/food/drinks/mug/tea = 6,
		/obj/item/reagent_containers/food/drinks/mug/coco = 3
	)
	contraband = list(
		/obj/item/reagent_containers/food/drinks/ice = 12
	)
	refill_canister = /obj/item/vending_refill/coffee
	default_price = PAYCHECK_PRISONER
	extra_price = PAYCHECK_ASSISTANT
	payment_department = ACCOUNT_SRV
	light_mask = "coffee-light-mask"
	light_color = COLOR_DARK_MODERATE_ORANGE

/obj/item/vending_refill/coffee
	machine_name = "Solar's Best Hot Drinks"
	icon_state = "refill_joe"
