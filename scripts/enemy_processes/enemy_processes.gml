function calc_entity_movement() {
	//@desc --> moves enemy and applies drag
	
	// apply movement
	x += hsp;
	y += vsp;
	
	// slowdown --> HSP and VSP approach 0 (ZERO) over time
	hsp *= global.drag
	vsp *= global.drag
	
	check_if_stopped();
}

function calc_knockback_movement() {
	//@desc --> moves enemy and applies drag during knockback
	
	// apply movement
	x += hsp;
	y += vsp;
	
	//slowdown
	hsp *= 0.91;
	vsp *= 0.91;
	
	check_if_stopped();
	
	// exit state
	if knockback_time <= 0 state = STATES.IDLE;
}

function check_facing() {
	//@desc --> check witch way we are moving and set facing
	if knockback_time <= 0 {
		var _facing = sign(x - xprev);
		if _facing != 0 facing = _facing;	
	}

}

function check_for_player() {
	//@desc --> check if the player is close enough to start chasing them
	
	// ensures player is alive. If player is dead no need to run this code block
	if o_player.state == STATES.DEAD exit;
	
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
			if (x == xprev and y == yprev) var _type = 0 else var _type = 1
			var _found_player = mp_grid_path(global.mp_grid, path, x, y, o_player.x  + delta_x, o_player.y  + delta_y, _type);
	
			// start path if we can reach the player
			if _found_player {
				path_start(path, move_spd, path_action_stop, false);	
			}	
		}
	} else {
		// are we close enough to attack
		if _dis <= attack_dis {
			path_end();	
			state = STATES.ATTACK;
		}
	}
}

function enemy_anim() {
	switch(state) {
		case STATES.IDLE:
			sprite_index = s_idle;
			show_hurt();
		break;
		case STATES.MOVE:
			sprite_index = s_walk;
			show_hurt();
		break;
		case STATES.KNOCKBACK:
			show_hurt();
		break;
		case STATES.ATTACK:
			sprite_index = s_attack;
		break;
		case STATES.DEAD:
			sprite_index = s_dead;
		break;
	}
	// set depth
	depth = -bbox_bottom;
	
	// update out previous position
	xprev = x;
	yprev = y
}

function perform_attack() {
	//@desc --> attack plater when we are at the correct frame
	
	if image_index >= attack_frame and can_attack {
		// reset for the next attack
		can_attack = false;
		alarm[0] = attack_cooldown;
		
		// get attack direction
		var _dir = point_direction(x, y, o_player.x, o_player.y);
		
		// get attack position
		var _hitbox_x = x + lengthdir_x(attack_dis, _dir);
		var _hitbox_y = y + lengthdir_y(attack_dis, _dir);
		
		// create hitbox and pass our variables to the hitbox
		var _inst = instance_create_layer(_hitbox_x, _hitbox_y, "Instances", o_enemy_hitbox);
		_inst.owner_id = id;
		_inst.damage = damage;
		_inst.knockback_time = knockback_time;
	}
}

function show_hurt() {
	//@desc --> shows the hurt sprite when being knocked back
	if knockback_time-- > 0 sprite_index = s_hurt
}

function disappear_enemy() {
	//@desc --> if the dead enemy has existed for 120 seconds remove them
	if alarm[ENEMY_DISAPPEAR] <= 0 {
		alarm[ENEMY_DISAPPEAR] = disappear_timer;
	}
}