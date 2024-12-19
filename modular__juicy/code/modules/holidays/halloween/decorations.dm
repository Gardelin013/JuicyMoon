
/obj/item/decoration/halloween
	desc = "Everybody scream!"
	icon = 'modular__juicy/icons/holidays/halloween/decorations.dmi'
	icon_state = "1"

/obj/item/weapon/carved_pumpkin
	name = "carved pumpkin"
	desc = "Everybody hail to the pumkin song!"
	icon = 'modular__juicy/icons/holidays/halloween/decorations.dmi'
	icon_state = "pumpkin"
	var/icon_state_off = "pumpkin"
	var/obj/item/candle/candle
	var/candled = FALSE

/obj/item/weapon/carved_pumpkin/candled
	candled = TRUE

/obj/item/weapon/carved_pumpkin/Initialize(mapload)
	. = ..()
	icon_state_off = "pumpkin_[rand(1, 8)]"
	icon_state = icon_state_off

	if(candled)
		candle = new(src)
		candle.light()
		update_icon()

/obj/item/weapon/carved_pumpkin/update_icon()
	if(candle)
		icon_state = "[icon_state_off]_on"
		light_color = candle.light_color
		set_light(3)
	else
		icon_state = icon_state_off
		set_light(0)

/obj/item/weapon/carved_pumpkin/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/candle) && !candle)
		var/obj/item/candle/new_candle = I
		if(!new_candle.lit)
			return
		user.dropItemToGround(new_candle, src)
		candle = new_candle
		update_icon()
		return
	return ..()

/obj/item/weapon/carved_pumpkin/attack_self(mob/user)
	. = ..()

	if(do_after(user, 5, target = src))
		user.put_in_hands(candle)
		candle = null
		update_icon()

// Garland
/obj/item/decoration/garland/halloween
	desc = "Beautiful lights! Shinee!"
	icon = 'modular__juicy/icons/holidays/halloween/decorations.dmi'
	icon_state = "garland"
	light_colors = list("#f8731e", "#ffd401", "#ef0001")
	variations = 7

/obj/item/decoration/garland/halloween/Initialize(mapload)
	if(random)
		icon_state_off = "garland_[rand(1, variations)]"
	. = ..()

/obj/item/decoration/garland/halloween/long
	icon_state = "garland_1"
	icon_state_off = "garland_1"
	random = FALSE

/obj/item/decoration/garland/halloween/medium
	icon_state = "garland_2"
	icon_state_off = "garland_2"
	random = FALSE

/obj/item/decoration/garland/halloween/short
	icon_state = "garland_3"
	icon_state_off = "garland_3"
	random = FALSE

// Tinsels
/obj/item/decoration/tinsel/halloween
	desc = "Everybody scream! Everybody scream! In our town of Halloween!"
	icon = 'modular__juicy/icons/holidays/halloween/tinsel.dmi'
	icon_state = "1"
	variations = 20
	random = TRUE

/obj/item/decoration/tinsel/halloween/attack_self(mob/user)
	. = ..()
	setDir(turn(dir,-90))

/obj/item/decoration/tinsel/halloween/pumkings
	icon_state = "1"
	random = FALSE

/obj/item/decoration/tinsel/halloween/ghosts
	icon_state = "2"
	random = FALSE

/obj/item/decoration/tinsel/halloween/bats
	icon_state = "14"
	random = FALSE
