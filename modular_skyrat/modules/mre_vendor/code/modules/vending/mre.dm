/obj/machinery/vending/mre
	name = "\improper MRE Vendor"
	desc = "A vending machine which dispenses MREs, suitable for a diverse crew's dietary preferences."
	product_ads = "Suspiciously delicious!;Chef's making rat toast again, huh?;Made with love and arsenic!;Guaranteed potentially safe!;95% rat free.;Mind the razor blades."
	light_mask = "snack-light-mask"
	icon = 'modular_skyrat/modules/mre_vendor/icons/obj/mrevendor.dmi'
	icon_state = "mre"
	products = list(
		/obj/item/storage/box/mre/mre_spaghetti = 12,
		/obj/item/storage/box/mre/mre_hotdog = 12,
		/obj/item/storage/box/mre/mre_cheeseburger = 12,
		/obj/item/storage/box/mre/mre_indian = 12,
		/obj/item/storage/box/mre/mre_cajun = 12,
		/obj/item/storage/box/mre/mre_asian = 12,
		/obj/item/storage/box/mre/mre_fiesta = 12,
		/obj/item/storage/box/mre/mre_continental = 12,
		/obj/item/storage/box/mre/mre_breakfast = 12,
		/obj/item/storage/box/mre/mre_sweet = 12,
		/obj/item/storage/box/mre/mre_seafood = 12,
		/obj/item/storage/box/mre/mre_coldweather = 12,
		/obj/item/storage/box/mre/mre_carnivore = 12,
		/obj/item/storage/box/mre/mre_vegan = 12,
		/obj/item/storage/box/mre/mre_lizard = 12,
		/obj/item/storage/box/mre/mre_electric = 12,
		/obj/item/storage/box/mre/mre_moth = 12,
		/obj/item/storage/box/mre/mre_gamer = 12,
		/obj/item/storage/box/mre/mre_crayon = 12
	)

	contraband = list(
		/obj/item/storage/box/mre/mre_unhappy = 12
	)

	refill_canister = /obj/item/vending_refill/mre
	default_price = 100
	payment_department = ACCOUNT_SRV

/obj/item/vending_refill/mre
	machine_name = "MRE Vendor"
	icon_state = "refill_snack"
