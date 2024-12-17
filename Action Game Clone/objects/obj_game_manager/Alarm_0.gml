/// @description Insert description here
// You can write your code in this editor
var _l_r = irandom(1);
if(_l_r == 0){
	var instance = instance_create_layer(-300,random_range(200,room_height - 300),"Instances",planes[irandom(1)]);
	instance.mov_dir = "right";
	instance.image_xscale = -1;
}
else{
	var instance = instance_create_layer(room_width+300,random_range(200,room_height - 300),"Instances",planes[irandom(1)]);
	instance.mov_dir = "left";
	instance.image_xscale = 1;
}

alarm[0]=irandom_range(500,800);