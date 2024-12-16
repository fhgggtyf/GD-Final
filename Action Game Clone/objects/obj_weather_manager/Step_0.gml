/// @description Insert description here
// You can write your code in this editor
if(instance_number(obj_cloud) >= 20 && !global.israining){
	global.israining=true;
	audio_play_sound(snd_rain,0,true);
	alarm[1] = 50;
}
else if(instance_number(obj_cloud) <= 13){
	global.israining=false;
	audio_stop_sound(snd_rain);
}

