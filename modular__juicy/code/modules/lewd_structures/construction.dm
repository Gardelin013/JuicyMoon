///The item used as the basis for construction kits for organic interface
/obj/item/construction_kit
	name = "construction kit"
	desc = "Used for constructing various things"
	w_class = WEIGHT_CLASS_BULKY
	obj_flags = CAN_BE_HIT
	throwforce = 0
	///What is the path for the resulting structure generating by using this item?
	var/obj/structure/resulting_structure = /obj/structure/chair
	///How much time does it take to construct an item using this?
	var/construction_time = 8 SECONDS

/obj/item/construction_kit/Initialize(mapload)
	. = ..()
	name = "[initial(resulting_structure.name)] [name]"

/obj/item/construction_kit/examine(mob/user)
	. = ..()
	. += span_purple("[src] can be assembled by using <b>Ctrl+Shift+Click</b> while [src] is on the floor.")

/obj/item/construction_kit/CtrlShiftClick(mob/user)
	if((item_flags & IN_INVENTORY) || (item_flags & IN_STORAGE))
		return

	to_chat(user, span_notice("You begin to assemble [src]..."))
	if(!do_after(user, construction_time, src))
		to_chat(user, span_warning("You fail to assemble [src]!"))
		return

	new resulting_structure (get_turf(src))
	qdel(src)
	to_chat(user, span_notice("You assemble [src]."))

// BDSM FURNITURE
/obj/item/construction_kit/bdsm
	icon = 'modular__juicy/icons/obj/structures/bdsm_furniture.dmi'

// X-STAND

/obj/item/construction_kit/bdsm/x_stand
	icon_state = "xstand_kit"
	resulting_structure = /obj/structure/chair/x_stand


/obj/item/construction_kit/bdsm/bed
	icon_state = "bdsm_bed_kit"
	resulting_structure = /obj/structure/bed/bdsm_bed

/obj/item/construction_kit/bdsm/shibari
	icon_state = "shibari_kit"
	resulting_structure = /obj/structure/chair/shibari_stand