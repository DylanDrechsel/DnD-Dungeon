event_inherited()

// player stats
movement_spd = 1.5;
walk_spd = 1.5;
sprint_spd = 2.25;
hp_max = 10;
hp = hp_max;
stamina_max = 100;
stamina = stamina_max;

// regen time
stamina_regen_time = 60;

// bow
aim_dir = 0;
bow_dis = 11;
fire_rate = 30;
can_attack = true;
arrow_speed = 8;

// bomb
can_throw_bomb = true; // can the player throw the bomb now?
bomb_cooldown = 120;   // how long until the bomb is ready to throw again
bomb_power = 8;		   // how far we throw the bomb

// dash
dash_spd = 4;
dash_arr = [];
can_dash = true;
dash_cooldown = 120;
dash_timer_initial = 15;
dash_timer = dash_timer_initial;

my_bow = instance_create_layer(x, y, "Instances", o_bow);

// ensures we can restart after death animaion
ready_to_restart = false;

cursor_sprite = s_cursor;
window_set_cursor(cr_none);