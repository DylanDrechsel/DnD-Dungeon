/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(o_controls)) {
	instance_destroy(o_controls);
}
else {
	instance_create_layer(room_width / 2, room_height - 100, "Instances", o_controls);
}