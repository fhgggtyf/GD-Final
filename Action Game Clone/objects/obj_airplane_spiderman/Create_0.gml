/// @description Insert description here
// You can write your code in this editor

mov_dir = "right";
audio_play_sound(snd_spiderman,1,false);
broke = false;
creation_time = 0;

function broken(){
	if(!broke){
		audio_play_sound(snd_boom,1,false);
		
		var ins = instance_find(obj_game_manager,0)
		ins.screen_shake()
		broke = true;
		image_index = 1;
		vspeed = 10;
		if(image_xscale == -1){
			image_angle = 315;
		}
		else{
			image_angle = 45;
		}
	
		instance_create_layer(x,y,"Instances",obj_spiderman);

	}
}