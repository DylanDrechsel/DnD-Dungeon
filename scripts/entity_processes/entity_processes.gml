function damage_entity(_targetID, _sourceID, _damage, _time) {
	//@desc --> damage the target and return the dead status	
	//@arg	--> targetID		real
	//@arg  --> sourceID		real
	//@arg  --> damage			real	how much damage to deal
	//@arg  --> time			real	how long to knock back target
	
	with(_targetID) {
		// take no damage while HURT Alarm is running tom avoid massive hits from all emenies at once
		if alarm[HURT] > 0 exit;
		
		hp -= _damage;
		var _dead = is_dead(_damage);
		path_end();
		
		// was trying floating damage text
		//alarm[DISPLAY_TOOLTIP] = 120
		
		// set knockback distance
		if _dead var _dis = 5 else var _dis = 3
		var _dir = point_direction(_sourceID.x, _sourceID.y, x, y);
		
		hsp += lengthdir_x(_dis, _dir);
		vsp += lengthdir_y(_dis, _dir);
		calc_path_delay = _time;
		alert = true;
		knockback_time = _time;
		alarm[HURT] = hurt_time;
		if !_dead state = STATES.KNOCKBACK;
		image_index = 0;
		return _dead;
	}
}

function is_dead(_damage) {
	//@desc --> checks if the instance running this is dead
	
	if state != STATES.DEAD {
		if hp <= 0 {
			state = STATES.DEAD;
			hp = 0;
			image_index = 0;
			
			// set death sound
			switch(object_index) {
					default:
						// play sound
					break;
					case o_player:
						if instance_exists(my_bow) instance_destroy(my_bow);
						// player sound
					break;
			}
			return true;
		}
	} else return true;
}

function check_if_stopped() {
	if abs(hsp) < 0.1 hsp = 0;
	if abs(vsp) < 0.1 vsp = 0;
}

function show_healthbar() {
	//@desc --> show health bar above entities head
	
	if hp != hp_max and hp > 0 {
		var _x1 = x - 17;
		var _x2 = x + 17;
		var _y1 = y - 19;
		var _y2 = y - 11;
		
		draw_healthbar(_x1, _y1, _x2, _y2, hp/hp_max*100, $003300, $3232FF, $00B200, 0, 1, 1);
		show_text(hp, hp_max, 0);

		// Draw the text on the health bar
		draw_text((_x1 + _x2) / 2, (_y1 + _y2) / 2, string(hp) + " / " + string(hp_max));
	}
}

function show_staminabar() {
	//@desc --> show stamina bar above players head
	var _x1 = x - 17;
	var _x2 = x + 17;
	var _y1 = y - 39;
	var _y2 = y - 32;
	
	draw_healthbar(_x1, _y1, _x2, _y2, stamina/stamina_max*100, $003300, $3232FF, c_olive, 0, 1, 1);
	show_text(stamina, stamina_max, 0);
	
	// Draw the text on the health bar
	draw_text((_x1 + _x2) / 2, (_y1 + _y2) / 2, string(stamina) + " / " + string(stamina_max));
}

function show_text(_x, _x_max, _color_changing_font) {
	draw_set_halign(fa_center); // Center align text horizontally
	draw_set_valign(fa_middle); // Center align text vertically
	draw_set_font(fnt_small);	// Small Font
	
	// change color of text based on how much Stamina is left
	if _color_changing_font {
		if _x / _x_max >= 0.7 draw_set_color(c_green);
		if _x / _x_max <= 0.69 and _x / _x_max >= 0.3 draw_set_color(c_yellow);
		if _x / _x_max <= 0.29 and _x / _x_max >= 0 draw_set_color(c_red);
	}
}