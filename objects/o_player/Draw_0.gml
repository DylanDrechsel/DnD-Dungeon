/// @description Insert description here
// You can write your code in this editor

// draw the dash anim
var _size = array_length(dash_arr);
for (var _i = _size - 1; _i >= 0; _i--) {
	dash_arr[_i].image_alpha -= 0.05;
	
	if dash_arr[_i].image_alpha > 0 {
		draw_sprite_ext(s_player_dash, 0, dash_arr[_i].x, dash_arr[_i].y, facing, 1, 0, c_white, dash_arr[_i].image_alpha)	
	} else array_delete(dash_arr, _i, 1);
}

// Inherit the parent event
event_inherited();

show_staminabar();

//draw_text(x, y, movement_spd);
//draw_text(x + 25, y + 25, "Stamina: " + string(stamina));

if mouse_check_button_pressed(mb_right) and show_tooltip == false {
	alarm[DISPLAY_TOOLTIP] = 60;
	show_tooltip = true;
}

if !can_dash {
	draw_text(x, y + 50, "Dash ready in " + string(round(alarm[CAN_DASH] / 10)));	
}

if show_tooltip == true {
	//draw_set_font(fnt_medium);
	
	if can_throw_bomb and stamina < 15 {
		draw_text(x, y, "Not enough stamina!");	
	}
	
	if can_throw_bomb == false {
		alarm[DISPLAY_TOOLTIP] = alarm[CAN_THROW_BOMB];
		draw_text(x, y + 25, "Bomb ready to throw in " + string(round(alarm[CAN_THROW_BOMB] / 10)))
	}
}