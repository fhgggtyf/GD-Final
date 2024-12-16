/// @description Insert description here
// You can write your code in this editor
_player_id = 0;

v_modifier=1;
h_modifier=1;
acc_modifier = 1.5;

collider_height = bbox_bottom - bbox_top;
collider_width = bbox_right - bbox_left;

dead = false;

init = false;

respawn_wait = false;

xacc = 3;
xdcc = 1;

gravity = 9.8/5;
gravity_direction = 270;

control_set = [vk_anykey, vk_anykey, vk_anykey];

_health = 530;

modifiers = [];

function check_collider_win(_instance){
	with(_instance){
        var v_speed_self = vspeed;
        var v_speed_other = other.vspeed;
        
        var substeps = max(abs(v_speed_self), abs(v_speed_other));
        if (substeps < 1) substeps = 1;
        
        for (var i = 1; i <= substeps; i++){
            var interpolated_y_self = y + (v_speed_self / substeps) * i;
            var interpolated_y_other = other.y + (v_speed_other / substeps) * i;
          
            if (interpolated_y_self - collider_height + 30 >= interpolated_y_other){
                return true;
            }
        }
		
		var relative_vspeed = v_speed_self - v_speed_other;
		substeps = abs(relative_vspeed);
        if (substeps < 1) substeps = 1; 
		
        for (var i = 1; i <= substeps; i++) {           
            var interpolated_y_self = y - (v_speed_self / substeps) * i;
            var interpolated_y_other = other.y - (v_speed_other / substeps) * i;
            
            if (interpolated_y_self - collider_height + 30 >= interpolated_y_other) {
                return true;
            }
        }
        
        return false;
	}
}

function die(){
	audio_play_sound(snd_die,0,false);
	var ins = instance_find(obj_game_manager,0)
	ins.screen_shake(20)
	var particle_system = part_system_create();
	part_particles_burst(particle_system, x+0.5*collider_width, y, deathParticles);
	vspeed = 20;
	dead = true;
	image_index=2;
}

function respawn(){
	if(!dead){
		if(init){
			audio_play_sound(snd_die,1,false);
		}
		dead = true;
		global._score[_player_id]--;
		_health -= 30;
		var ins = instance_find(obj_game_manager,0)
		ins.screen_shake(15)
	}

	if(init){
		audio_play_sound(snd_drop,0,false);
	}	
	alarm[0]=120;
	respawn_wait = true;
}