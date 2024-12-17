/// @description Insert description here
// You can write your code in this editor
if(check_collider_win(other) && vspeed > 0 && !dead && !other.stpd){
	other.stepped();
	audio_play_sound(snd_hit_cloud,0,false);
	vspeed = -50 * v_modifier * (1+ movement_buff);
}