function damage_entity(_targetID, _sourceID, _damage, _time) {
	//@desc --> damage the target and return the dead status	
	//@arg	--> targetID		real
	//@arg  --> sourceID		real
	//@arg  --> damage			real	how much damage to deal
	//@arg  --> time			real	how long to knock back target
	
	with(_targetID) {
		hp -= _damage;
		var _dead = is_dead(_damage);
		path_end();
		
		// set knockback distance
		if _dead var _dis = 4 else var _dis = 1
		var _dir = point_direction(_sourceID.x, _sourceID.y, x, y);
		
		hsp += lengthdir_x(_dis, _dir);
		vsp += lengthdir_y(_dis, _dir);
		calc_path_delay = _time;
		alert = true;
		knockback_time = _time;
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
		draw_healthbar(x-7, y-16, x+7, y-14, hp/hp_max*100, $003300, $3232FF, $00B200, 0, 1, 1);		
	}
}