/// @description Insert description here
// You can write your code in this editor
if(global.israining){
	var check_y = y - 1; // Start just above the object
	var found_object = noone;
	var max_distance = 2000; // Set a limit for the search to prevent infinite loop

	// Loop upwards until we find an object or reach the maximum search distance
	while (check_y > y - max_distance) {
	    found_object = instance_place(x, check_y, obj_cloud);

	    if (found_object != noone) {
	        v_modifier=0.7;
	        break;
	    }

	    // Move up one pixel
	    check_y -= 1;
	}
}
else{
	v_modifier=1;
}

if(global.winddir=="left"){
	h_modifier=abs(h_modifier) * -1;
}
else{
	h_modifier=abs(h_modifier);
} 

if(keyboard_check(control_set[0]) && !dead){
	modded_xacc=xacc-h_modifier;
	hspeed = global.winddir == "left" ? max(hspeed - modded_xacc, -25 * acc_modifier) : max(hspeed - modded_xacc, -25 / acc_modifier);
}
else if(keyboard_check(control_set[1]) && !dead){
	modded_xacc=xacc+h_modifier;
	hspeed = global.winddir == "right" ? min(hspeed + modded_xacc, 25 * acc_modifier) : min(hspeed + modded_xacc, 25 / acc_modifier);
}
else{
	var hspeed_temp = hspeed;
	if(abs(hspeed) <= xdcc){
		hspeed_temp=0;
	}
	else{
		hspeed_temp -= sign(hspeed) * xdcc;
	}
	
	if(hspeed_temp < acc_modifier){
		hspeed_temp = global.winddir == "left" ? -acc_modifier: acc_modifier;	
	}
	
	hspeed=hspeed_temp;
}

if(dead && vspeed + gravity>0 && vspeed<0){
	dead = false;
}

if(vspeed < 0 && not dead){
	var temp = image_xscale
	image_index = 0;
	image_xscale = temp;
}
else if (vspeed > 0 && not dead){
	var temp = image_xscale
	image_index = 1;
	image_xscale = temp;
}

if (x <= collider_width + 70) {
    x = collider_width + 70;
//    hspeed = 10;
//	audio_play_sound(snd_hit_wall,0,false);
} else if (x >= room_width - collider_width - 70) {
    x = room_width - collider_width - 70;
//    hspeed = -10;
//	audio_play_sound(snd_hit_wall,0,false);
}

if(hspeed>0){
	image_xscale=-1;
}
else if(hspeed<0){
	image_xscale=1;
}

if(y>room_height+500 && not respawn_wait){
	respawn();
}