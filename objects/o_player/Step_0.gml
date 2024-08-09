// Player Movement
switch(state) {
	default:
		reset_variables();
		get_input();
		calc_movement();
		stamina_regen();
		aim_bow();
		check_dash();
		check_fire();
		check_bomb();
		anim();
	break;
	case STATES.DASH:
		reset_variables();
		array_push(dash_arr, {x : x, y : y, image_alpha: 0.75});
		x += hsp;
		y += vsp;
		if dash_timer-- <= 0 {
			state = STATES.MOVE;
			hsp = 0;
			vsp = 0;
			can_dash = false;
			alarm[CAN_DASH] = dash_cooldown;
			image_index = 2
		}
	break;
	case STATES.KNOCKBACK:
		reset_variables();
		calc_movement();
		stamina_regen();
		aim_bow();
		if knockback_time-- <= 0  state = STATES.IDLE;
		anim();
	break;
	case STATES.DEAD:
		reset_variables();
		calc_movement();
		if ready_to_restart and mouse_check_button_pressed(mb_left) game_restart();
		anim();
	break;
}