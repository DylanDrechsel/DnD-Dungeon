state = STATES.IDLE

// init previous positions
xprev = x;
yprev = y;
hsp = 0;
vsp = 0;

// player facing direction
facing = 1;

// how long we are knocked back for 
knockback_time = 0;

// hurt frames --> No Damage can be taken
hurt_time = 30;

// Flash WHITE when game is taken
flash_initial = 16;
flash = flash_initial / 2;