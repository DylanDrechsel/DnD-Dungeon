/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

show_staminabar()

//draw_text(x, y, movement_spd);
//draw_text(x + 25, y + 25, "Stamina: " + string(stamina));

if mouse_check_button_pressed(mb_right) and stamina < 15 {
	draw_text(x, y, "Not Enough Stamina");
}