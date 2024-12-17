/// @description Insert description here
// You can write your code in this editor
if(check_collider_win(other) && vspeed > 0 && !dead && !other.dead){
	global._score[_player_id]++;
	vspeed = -50*v_modifier;
	with(other){
		die();
		_health -= (other.damage + other.dmg_mod);
	}
	
}