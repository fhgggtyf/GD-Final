/// @description Insert description here
// You can write your code in this editor
alarm[0]=interval

var create_x = irandom(room_width div 256) * 256;
var create_y = irandom_range((room_height div 3) div 192, (room_height - 300) div 192) * 192

if(!position_meeting(create_x, create_y, obj_cloud)){
	instance_create_layer(create_x, create_y, "Instances", obj_cloud_1)
}