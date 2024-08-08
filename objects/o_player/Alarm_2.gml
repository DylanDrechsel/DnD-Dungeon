if stamina >= 100 exit
if stamina > 91 and stamina < 100 {
	var _delta = stamina_max - stamina;
	stamina += _delta
}
if stamina < 90 stamina += 10;
