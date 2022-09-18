/////////////////////////////////////////
/////////////////Weapons/////////////////
/////////////////////////////////////////

/datum/design/c38/sec
	id = "sec_38"
	build_type = PROTOLATHE | AWAY_LATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	autolathe_exportable = FALSE //Redundant, there's already an autolathe version.

/datum/design/c38_trac
	name = "Speed Loader (.38 TRAC)"
	desc = "Designed to quickly reload revolvers. TRAC bullets embed a tracking implant within the target's body."
	id = "c38_trac"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 20000, /datum/material/silver = 5000, /datum/material/gold = 1000)
	build_path = /obj/item/ammo_box/c38/trac
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c38_hotshot
	name = "Speed Loader (.38 Hot Shot)"
	desc = "Designed to quickly reload revolvers. Hot Shot bullets contain an incendiary payload."
	id = "c38_hotshot"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 20000, /datum/material/plasma = 5000)
	build_path = /obj/item/ammo_box/c38/hotshot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c38_iceblox
	name = "Speed Loader (.38 Iceblox)"
	desc = "Designed to quickly reload revolvers. Iceblox bullets contain a cryogenic payload."
	id = "c38_iceblox"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 20000, /datum/material/plasma = 5000)
	build_path = /obj/item/ammo_box/c38/iceblox
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c38_rubber
	name = "Speed Loader (.38 Rubber)"
	desc = "Designed to quickly reload revolvers. Rubber bullets are bouncy and less-than-lethal."
	id = "c38_rubber"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/c38/match/bouncy
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/a44
	name = "Speed Loader (.44 Rubber)"
	desc = "Designed to quickly reload revolvers. Rubber bullets are bouncy and less-than-lethal."
	id = "a44"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/a44
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/a44_fmj
	name = "Speed Loader (.44 FMJ)"
	desc = "Designed to quickly reload revolvers."
	id = "a44_fmj"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 30000)
	build_path = /obj/item/ammo_box/a44/fmj
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m45
	name = "Magazine (.45 Rubber - Handgun)"
	desc = "Designed to quickly reload the Liberator handgun. Rubber bullets are bouncy and less-than-lethal."
	id = "m45"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/magazine/m45
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m45_fmj
	name = "Magazine (.45 FMJ - Handgun)"
	desc = "Designed to quickly reload the Liberator handgun.."
	id = "m45_fmj"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 30000)
	build_path = /obj/item/ammo_box/magazine/m45/fmj
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m9mm
	name = "Magazine (9mm Rubber)"
	desc = "Designed to quickly reload the Equalizer handgun. Rubber bullets are bouncy and less-than-lethal."
	id = "m9mm"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/magazine/m9mm
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m9mm_fmj
	name = "Magazine (9mm FMJ)"
	desc = "Designed to quickly reload the Equalizer handgun."
	id = "m9mm_fmj"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 30000)
	build_path = /obj/item/ammo_box/magazine/m9mm/fmj
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m556
	name = "Magazine (5.56 FMJ)"
	desc = "Designed to quickly reload the Valiant assault rifle."
	id = "m556"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 30000)
	build_path = /obj/item/ammo_box/magazine/m556
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m556ap
	name = "Magazine (5.56 AP)"
	desc = "Designed to quickly reload the Valiant assault rifle. Armour-piercing rounds cut through armour, but cause less trauma on impact."
	id = "m556ap"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 40000, /datum/material/uranium = 5000)
	build_path = /obj/item/ammo_box/magazine/m556/ap
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m556hp
	name = "Magazine (5.56 HP)"
	desc = "Designed to quickly reload the Valiant assault rifle. Hollowpoints expand on impact, but are stopped easily by armour."
	id = "m556hp"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 40000, /datum/material/gold = 5000)
	build_path = /obj/item/ammo_box/magazine/m556/hp
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/m556i
	name = "Magazine (5.56 Incendiary)"
	desc = "Designed to quickly reload the Valiant assault rifle. Incendiaries cause minimal damage, but cause fires on impact."
	id = "m556i"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 40000, /datum/material/plasma = 5000)
	build_path = /obj/item/ammo_box/magazine/m556/i
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/a762
	name = "Stripper Clip (7.62 FMJ)"
	desc = "Designed to quickly reload the Memoria bolt-action rifle."
	id = "a762"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 30000)
	build_path = /obj/item/ammo_box/a762
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/a762ap
	name = "Stripper Clip (7.62 AP)"
	desc = "Designed to quickly reload the Memoria bolt-action rifle. Armour-piercing rounds cut through armour, but cause less trauma on impact."
	id = "a762ap"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 40000, /datum/material/uranium = 5000)
	build_path = /obj/item/ammo_box/a762/ap
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/a762hp
	name = "Stripper Clip (7.62 HP)"
	desc = "Designed to quickly reload the Memoria bolt-action rifle. Hollowpoints expand on impact, but are stopped easily by armour."
	id = "a762hp"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 40000, /datum/material/gold = 5000)
	build_path = /obj/item/ammo_box/a762/hp
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/a762i
	name = "Stripper Clip (7.62 Incendiary)"
	desc = "Designed to quickly reload the Memoria bolt-action rifle. Incendiaries cause minimal damage, but cause fires on impact."
	id = "a762i"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 40000, /datum/material/plasma = 5000)
	build_path = /obj/item/ammo_box/a762/i
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/smgm45
	name = "Magazine (.45 HP - SMG)"
	desc = "Designed to quickly reload the Helios PDW."
	id = "smgm45"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 30000)
	build_path = /obj/item/ammo_box/magazine/smgm45
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/smgm45ap
	name = "Magazine (.45 AP - SMG)"
	desc = "Designed to quickly reload the Helios PDW. Armour-piercing rounds cut through armour, but cause less trauma on impact."
	id = "smgm45ap"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 40000, /datum/material/uranium = 5000)
	build_path = /obj/item/ammo_box/magazine/smgm45/ap
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/smgm45fmj
	name = "Magazine (.45 FMJ - SMG)"
	desc = "Designed to quickly reload the Helios PDW. Hollowpoints expand on impact, but are stopped easily by armour."
	id = "smgm45fmj"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 40000, /datum/material/gold = 5000)
	build_path = /obj/item/ammo_box/magazine/smgm45/fmj
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/smgm45i
	name = "Magazine (.45 Incendiary - SMG)"
	desc = "Designed to quickly reload the Helios PDW. Incendiaries cause minimal damage, but cause fires on impact."
	id = "smgm45i"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 40000, /datum/material/plasma = 5000)
	build_path = /obj/item/ammo_box/magazine/smgm45/i
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/buckshot/sec
	id = "sec_bshot"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_casing/shotgun/buckshot //I'll be fully honest I probably did this wrong. It looks nothing like the rubbershot one. If this bothers you please fucking fix it aaaa
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/rubbershot/sec
	id = "sec_rshot"
	build_type = PROTOLATHE | AWAY_LATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	autolathe_exportable = FALSE //Redundant

/datum/design/beanbag_slug/sec
	id = "sec_beanbag_slug"
	build_type = PROTOLATHE | AWAY_LATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/shotgun_dart/sec
	id = "sec_dart"
	build_type = PROTOLATHE | AWAY_LATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/incendiary_slug/sec
	id = "sec_Islug"
	build_type = PROTOLATHE | AWAY_LATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/pin_testing
	name = "Test-Range Firing Pin"
	desc = "This safety firing pin allows firearms to be operated within proximity to a firing range."
	id = "pin_testing"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 300)
	build_path = /obj/item/firing_pin/test_range
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pin_mindshield
	name = "Mindshield Firing Pin"
	desc = "This is a security firing pin which only authorizes users who are mindshield-implanted."
	id = "pin_loyalty"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/silver = 600, /datum/material/diamond = 600, /datum/material/uranium = 200)
	build_path = /obj/item/firing_pin/implant/mindshield
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pin_explorer
	name = "Outback Firing Pin"
	desc = "This firing pin only shoots while ya ain't on station, fair dinkum!"
	id = "pin_explorer"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/silver = 1000, /datum/material/gold = 1000, /datum/material/iron = 500)
	build_path = /obj/item/firing_pin/explorer
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/stunrevolver
	name = "Tesla Cannon Part Kit"
	desc = "The kit for a high-tech cannon that fires internal, reusable bolt cartridges in a revolving cylinder. The cartridges can be recharged using conventional rechargers."
	id = "stunrevolver"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 10000, /datum/material/silver = 10000)
	build_path = /obj/item/weaponcrafting/gunkit/tesla
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/nuclear_gun
	name = "Advanced Energy Gun Part Kit"
	desc = "The kit for an energy gun with an experimental miniaturized reactor."
	id = "nuclear_gun"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 2000, /datum/material/uranium = 3000, /datum/material/titanium = 1000)
	build_path = /obj/item/weaponcrafting/gunkit/nuclear
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/tele_shield
	name = "Telescopic Riot Shield"
	desc = "An advanced riot shield made of lightweight materials that collapses for easy storage."
	id = "tele_shield"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 4000, /datum/material/silver = 300, /datum/material/titanium = 200)
	build_path = /obj/item/shield/riot/tele
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/beamrifle
	name = "Beam Marksman Rifle Part Kit"
	desc = "The gunkit for a powerful long ranged anti-material rifle that fires charged particle beams to obliterate targets."
	id = "beamrifle"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 5000, /datum/material/diamond = 5000, /datum/material/uranium = 8000, /datum/material/silver = 4500, /datum/material/gold = 5000)
	build_path = /obj/item/weaponcrafting/gunkit/beam_rifle
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/decloner
	name = "Decloner Part Kit"
	desc = "Your opponent will bubble into a messy pile of goop."
	id = "decloner"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/gold = 5000,/datum/material/uranium = 10000)
	build_path = /obj/item/weaponcrafting/gunkit/decloner
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/rapidsyringe
	name = "Rapid Syringe Gun"
	desc = "A gun that fires many syringes."
	id = "rapidsyringe"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000)
	build_path = /obj/item/gun/syringe/rapidsyringe
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL //uwu

/datum/design/temp_gun
	name = "Temperature Gun Part Kit"
	desc = "A gun that shoots temperature bullet energythings to change temperature."//Change it if you want
	id = "temp_gun"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 500, /datum/material/silver = 3000)
	build_path = /obj/item/weaponcrafting/gunkit/temperature
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/flora_gun
	name = "Floral Somatoray"
	desc = "A tool that discharges controlled radiation which induces mutation in plant cells. Harmless to other organic life."
	id = "flora_gun"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 500, /datum/material/uranium = 2000)
	build_path = /obj/item/gun/energy/floragun
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/large_grenade
	name = "Large Grenade"
	desc = "A grenade that affects a larger area and use larger containers."
	id = "large_Grenade"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 3000)
	build_path = /obj/item/grenade/chem_grenade/large
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/pyro_grenade
	name = "Pyro Grenade"
	desc = "An advanced grenade that is able to self ignite its mixture."
	id = "pyro_Grenade"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 2000, /datum/material/plasma = 500)
	build_path = /obj/item/grenade/chem_grenade/pyro
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/cryo_grenade
	name = "Cryo Grenade"
	desc = "An advanced grenade that rapidly cools its contents upon detonation."
	id = "cryo_Grenade"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 500)
	build_path = /obj/item/grenade/chem_grenade/cryo
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/adv_grenade
	name = "Advanced Release Grenade"
	desc = "An advanced grenade that can be detonated several times, best used with a repeating igniter."
	id = "adv_Grenade"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 500)
	build_path = /obj/item/grenade/chem_grenade/adv_release
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/xray
	name = "X-ray Laser Gun Part Kit"
	desc = "Not quite as menacing as it sounds"
	id = "xray_laser"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/gold = 5000, /datum/material/uranium = 4000, /datum/material/iron = 5000, /datum/material/titanium = 2000, /datum/material/bluespace = 2000)
	build_path = /obj/item/weaponcrafting/gunkit/xray
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/ioncarbine
	name = "Ion Carbine Part Kit"
	desc = "How to dismantle a cyborg : The gun."
	id = "ioncarbine"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/silver = 6000, /datum/material/iron = 8000, /datum/material/uranium = 2000)
	build_path = /obj/item/weaponcrafting/gunkit/ion
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/wormhole_projector
	name = "Bluespace Wormhole Projector"
	desc = "A projector that emits high density quantum-coupled bluespace beams. Requires a bluespace anomaly core to function."
	id = "wormholeprojector"
	build_type = PROTOLATHE
	materials = list(/datum/material/silver = 2000, /datum/material/iron = 5000, /datum/material/diamond = 2000, /datum/material/bluespace = 3000)
	build_path = /obj/item/gun/energy/wormhole_projector
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/stunshell
	name = "Stun Shell"
	desc = "A stunning shell for a shotgun."
	id = "stunshell"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 200)
	build_path = /obj/item/ammo_casing/shotgun/stunslug
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/techshell
	name = "Unloaded Technological Shotshell"
	desc = "A high-tech shotgun shell which can be loaded with materials to produce unique effects."
	id = "techshotshell"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 200)
	build_path = /obj/item/ammo_casing/shotgun/techshell
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/suppressor
	name = "Suppressor"
	desc = "A reverse-engineered suppressor that fits on most small arms with threaded barrels."
	id = "suppressor"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 500)
	build_path = /obj/item/suppressor
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/gravitygun
	name = "One-point Gravitational Manipulator"
	desc = "A multi-mode device that blasts one-point bluespace-gravitational bolts that locally distort gravity. Requires a gravitational anomaly core to function."
	id = "gravitygun"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/silver = 8000, /datum/material/uranium = 8000, /datum/material/glass = 12000, /datum/material/iron = 12000, /datum/material/diamond = 3000, /datum/material/bluespace = 3000)
	build_path = /obj/item/gun/energy/gravity_gun
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/largecrossbow
	name = "Energy Crossbow Part Kit"
	desc = "A kit to reverse-engineer a proto-kinetic acceleratr into an energy crossbow, favored by syndicate infiltration teams and carp hunters."
	id = "largecrossbow"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1500, /datum/material/uranium = 1500, /datum/material/silver = 1500)
	build_path = /obj/item/weaponcrafting/gunkit/ebow
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/cleric_mace
	name = "Cleric Mace"
	desc = "A mace fit for a cleric. Useful for bypassing plate armor, but too bulky for much else."
	id = "cleric_mace"
	build_type = AUTOLATHE
	materials = list(MAT_CATEGORY_ITEM_MATERIAL = 12000)
	build_path = /obj/item/melee/cleric_mace
	category = list("Imported")

/datum/design/stun_boomerang
	name = "OZtek Boomerang"
	desc = "Uses reverse flow gravitodynamics to flip its personal gravity back to the thrower mid-flight. Also functions similar to a stun baton."
	id = "stun_boomerang"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 4000, /datum/material/silver = 10000, /datum/material/gold = 2000)
	build_path = /obj/item/melee/baton/security/boomerang
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
