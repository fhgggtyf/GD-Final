/// @description Insert description here
// You can write your code in this editor
creation_time++;
if ((x < 0 || x > room_width || y < 0 || y > room_height)&&creation_time>=200) {
    instance_destroy();
}
hspeed = mov_dir == "right" ? 10 : -10;

if(global.israining){
	var check_y = y - 1; // Start just above the object
	var found_object = noone;
	var max_distance = 2000; // Set a limit for the search to prevent infinite loop

	// Loop upwards until we find an object or reach the maximum search distance
	while (check_y > y - max_distance) {
	    found_object = instance_place(x, check_y, obj_cloud);

	    if (found_object != noone) {
	        broken();
	        break;
	    }

	    // Move up one pixel
	    check_y -= 1;
	}
}