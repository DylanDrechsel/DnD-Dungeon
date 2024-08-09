var _dir = point_direction(x, y, other.x, other.y);		// get dir to push enemy
var _force = force;										// set force as local variable for ease

with(other) {
	// push entity away horizontally
	hsp = lengthdir_x(_force, _dir);
	
	// push entity away vertically
	vsp = lengthdir_y(_force, _dir);
}

// damage entity
damage_entity(other, id, damage, random_range(45, 60))
