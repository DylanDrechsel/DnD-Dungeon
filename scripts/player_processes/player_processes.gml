function reset_variables() {
	left = 0;
	right = 0;
	up = 0;
	down = 0;
	vmove = 0;
	hmove = 0;
}

function get_input() {
	if keyboard_check(ord("A")) left = 1;
	if keyboard_check(ord("S")) down = 1;
	if keyboard_check(ord("D")) right = 1;
	if keyboard_check(ord("W")) up = 1;
}

function calc_movement() {
	hmove = right - left;
	vmove = down - up;
	
	// code for character facing based on cursor
	var _facing = (aim_dir < 90 or aim_dir > 270);
	if _facing == 0 _facing = -1;
	facing = _facing;
	
	//if hmove != 0 facing = hmove;
	
	if hmove != 0 or vmove != 0 {
		// get direction we are moving
		var _dir = point_direction(0, 0, hmove, vmove);
		
		// get distance we are moving
		hmove = lengthdir_x(walk_spd, _dir);
		vmove = lengthdir_y(walk_spd, _dir);
		
		// add movement to players position
		x += hmove;
		y += vmove;
	}
	
	// finding the aim direction
	aim_dir = point_direction(x, y, mouse_x, mouse_y);
	
	// setting the aim direction in the bow variable
	my_bow.image_angle = aim_dir;
}

function collision() {
	// set target values
	var _tx = x;
	var _ty = y;
	
	// move back to the last step position, out of the collision
	x = xprevious;
	y = yprevious;
	
	// get distance we want to move
	var _disx = abs(_tx - x);
	var _disy = abs(_ty - y);
	
	// move as far in x and y before hitting the solid
	repeat(_disx) {
		if !place_meeting(x + sign(_tx - x), y, o_solid) x += sign(_tx - x);
	}
	
	repeat(_disy) {
		if !place_meeting(x, y + sign(_ty - y), o_solid) y += sign(_ty - y);
	}
}

function anim() {
	if hmove != 0 or vmove != 0 {
		sprite_index = s_player_walk;	
	}
	
	if hmove = 0 and vmove = 0 {
		sprite_index = s_player_idle;	
	}
}

function check_fire() {
	if mouse_check_button(mb_left) {
		if can_fire {
			can_fire = false
			alarm[0] = fire_rate
			
			var _dir = point_direction(x, y, mouse_x, mouse_y);
			bow_dis = 5;
			
			var _inst = instance_create_layer(x, y, "Arrow", o_arrow);
			with(_inst) {
				speed = other.arrow_speed;	
				direction = _dir;
				image_angle = _dir;
				owner_id = other;
			}
		}
	}
}