event_inherited();
// enemy HP
hp_max = 15;
hp = hp_max;
// are we chasing the player?
alert = false;
// distance we can start chasing the player
alert_dis = 160;
// set distance we stop from the player
attack_dis = 12;
// the frame we perform our attack
attack_frame = 6;
// can we attack?
can_attack = true;
// attack delay
attack_cooldown = 75;
// damage dealt
damage = 2
// how long we knockback player for
knockback_time = 10;
// stop grouping of enemies
delta_x = irandom_range(-30, 30);
delta_y = irandom_range(-30, 30);
// create path resource
path = path_add();
// speed we chase player
move_spd = 1;
// set delay for calculating path
calc_path_delay = 30;
// set a timer for when we calc a path
calc_path_timer = irandom(60);
// randomize image index for off set animation
//image_index = irandom(10);
image_index = irandom_range(-100, 100);
// how long until the dead enemy disappears
disappear_timer = 600;