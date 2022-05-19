/mob/living/carbon/human/Topic(href, href_list)
	. = ..()

	if(href_list["lookup_info"])
		switch(href_list["lookup_info"])
			if("open_examine_panel")
				tgui.holder = src
				tgui.ui_interact(usr) //datum has a tgui component, here we open the window

/mob/living/carbon/human/verb/toggle_mutant_part_visibility()
	set category = "IC"
	set name = "Show/Hide Mutant Parts"
	set desc = "Allows you to choose to try and hide your mutant bodyparts under your clothes."

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You can't do this right now..."))
		return
	if(!try_hide_mutant_parts && !do_after(src, 3 SECONDS,target = src))
		return
	try_hide_mutant_parts = !try_hide_mutant_parts
	to_chat(usr, span_notice("[try_hide_mutant_parts ? "You try and hide your mutant body parts under your clothes." : "You no longer try and hide your mutant body parts"]"))
	update_mutant_bodyparts()
