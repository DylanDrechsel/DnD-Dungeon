damage = 5;
range = 160;
owner_id = noone;
knockback_time = 1;

function arrow_die() {
	// What happens when the arrow is destoryed
	
	speed = 0
	instance_change(o_arrow_explode, false);
}