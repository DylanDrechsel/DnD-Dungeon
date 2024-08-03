event_inherited();
// are we chasing the player?
alert = false;
// distance we can start chasing the player
alert_dis = 160;
// set distance we stop from the player
attack_dis = 18;
// create path resource
path = path_add();
// speed we chase player
move_spd = 1;
// set delay for calculating path
calc_path_delay = 30;
// set a timer for when we calc a path
calc_path_timer = irandom(60);
// randomize image index for off set animation
image_index = irandom(5);