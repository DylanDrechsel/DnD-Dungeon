// Player Movement
switch(state) {
	default:
		reset_variables();
		get_input();
		calc_movement();
		stamina_regen();
		aim_bow();
		check_fire();
		check_bomb();
		anim();
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