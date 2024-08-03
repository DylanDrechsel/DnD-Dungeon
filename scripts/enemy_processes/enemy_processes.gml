function check_for_player() {
	// check if the player is close enough to start chasing them
	var _dis = distance_to_object(o_player);
	//move_towards_point(o_player.x, o_player.y, 1);
	
	// can we start chasing? or are we already alert and out of attack dis?
	if (_dis <= alert_dis or alert) and _dis > attack_dis {
		// enemy is now alert
		alert = true
		
		//sprite_index = s_enemy_walk;
		
		// should we calc our path?
		if calc_path_timer-- <= 0 {
			// reset timer
			calc_path_timer = calc_path_delay;
		
			// can we make a path to the player
			if x == xprev and y = yprev var _type = 0 else var _type = 1
			var _found_player = mp_grid_path(global.mp_grid, path, x, y, o_player.x, o_player.y, _type);
	
			// start path if we can reach the player
			if _found_player {
				path_start(path, move_spd, path_action_stop, false);	
			}	
		}
	} else {
		// are we close enough to attack
		if _dis <= attack_dis {
			path_end();	
			//sprite_index = s_enemy_attack;
		}
	}
}

function enemy_anim() {
	switch(state) {
		case STATES.IDLE:
			sprite_index = s_idle
		break;
		case STATES.MOVE:
			sprite_index = s_walk
		break;
		case STATES.ATTACK:
			sprite_index = s_attack
		break;
		case STATES.DEAD:
			sprite_index = s_dead
		break;
	}
	
	// update out previous position
	xprev = x;
	yprev = y
}

function check_facing() {
	// check witch way we are moving and set facing
	var _facing = sign(x - xperv);
	
	if _facing != 0 facing = _facing;
}