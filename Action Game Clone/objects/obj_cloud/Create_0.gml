/// @description Insert description here
// You can write your code in this editor
next_instance = obj_cloud;
prev_instance = obj_cloud;

was_raining = false;

stpd = false;

collider_height = bbox_bottom - bbox_top;
collider_width = bbox_right - bbox_left;

if(global.israining){
	alarm[2]=random(200);
	was_raining=true;
}
else{
	alarm[0] = 60;
}

function to_next(){
	instance_create_layer(x,y,"Instances",next_instance);
	instance_destroy();
}

function to_prev(){
	instance_create_layer(x,y,"Instances",prev_instance);
	instance_destroy();
}

function stepped(){
	image_index++;
	alarm[1]=10;
	alarm[0]=0;
	stpd = true;
}

function is_not_top(){
	var isNotTop = false;
	with (obj_cloud) {
	    if (y < other.y && abs(x - other.x) < 128) {
	        isNotTop = true;
	        break; // Stop checking once an instance is found
	    }
	}

	return isNotTop;
}