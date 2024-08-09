/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

show_staminabar()

//draw_text(x, y, movement_spd);
//draw_text(x + 25, y + 25, "Stamina: " + string(stamina));

if mouse_check_button_pressed(mb_right) and show_tooltip == false {
	alarm[DISPLAY_TOOLTIP] = 60;
	show_tooltip = true;
}

if show_tooltip == true {
	draw_set_font(fnt_medium);
	
	if can_throw_bomb and stamina < 15 {
		draw_text(x, y, "Not enough stamina!");	
	}
	
	if can_throw_bomb == false {
		alarm[DISPLAY_TOOLTIP] = alarm[CAN_THROW_BOMB];
		draw_text(x, y, "Bomb ready to throw in " + string(round(alarm[CAN_THROW_BOMB] / 10)))
	}
}