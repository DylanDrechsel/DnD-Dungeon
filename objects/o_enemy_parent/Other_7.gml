switch(state) {
	case STATES.DEAD:
		image_index = image_number - 1;
		image_speed = 0;
	break;
	case STATES.ATTACK:
		image_index = 0;
		state = STATES.IDLE;
	break;
}