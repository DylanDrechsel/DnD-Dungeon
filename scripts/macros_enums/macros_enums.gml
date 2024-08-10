// MACROS
// Player Alarms
#macro CAN_ATTACK			0
#macro HURT					1
#macro STAMINA_REGEN		2
#macro CAN_THROW_BOMB		3
#macro CAN_DASH				4

// Enemy Alarms
#macro ENEMY_DISAPPEAR		2

// Text Alarms
#macro DISPLAY_TOOLTIP		11


// ENUMS
enum STATES {
	IDLE,
	MOVE,
	ATTACK,
	DEAD,
	KNOCKBACK,
	DASH,
}