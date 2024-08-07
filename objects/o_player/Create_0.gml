event_inherited()

// player stats
walk_spd = 1.5;
hp_max = 10;
hp = hp_max;

// bow
aim_dir = 0;
bow_dis = 11;
fire_rate = 30;
can_attack = true;
arrow_speed = 8;

my_bow = instance_create_layer(x, y, "Instances", o_bow);

// ensures we can restart after death animaion
ready_to_restart = false;

cursor_sprite = s_cursor;
window_set_cursor(cr_none);