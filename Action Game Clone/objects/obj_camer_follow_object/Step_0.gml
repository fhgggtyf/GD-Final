/// @description Insert description here
// You can write your code in this editor

var obj1 = obj_player_1;  
var obj2 = obj_player_2; 

if (instance_exists(obj1) && instance_exists(obj2)) {
	x = room_width/2 + global.shake_x;
	if(obj2.y >= room_height){
		y = obj1.y+global.shake_y;
	}
	else if(obj1.y >= room_height){
		y = obj2.y+global.shake_y
	}
	else{
		y = (obj1.y+obj2.y)/2 + global.shake_y;
	}
}