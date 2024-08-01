function reset_variables() {
	left = 0;
	right = 0;
	up = 0;
	down = 0;
}

function get_input() {
	if keyboard_check(ord("A")) left = 1;
	if keyboard_check(ord("S")) down = 1;
	if keyboard_check(ord("D")) right = 1;
	if keyboard_check(ord("W")) up = 1;
}

function calc_movement() {
	var _hmove = right - left;
	var _vmove = down - up;
	
	if _hmove != 0 or _vmove != 0 {
		// get direction we are moving
		var _dir = point_direction(0, 0, _hmove, _vmove);
		
		// get distance we are moving
		_hmove = lengthdir_x(walk_spd, _dir);
		_vmove = lengthdir_y(walk_spd, _dir);
		
		// add movement to players position
		x += _hmove;
		y += _vmove;
	}
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