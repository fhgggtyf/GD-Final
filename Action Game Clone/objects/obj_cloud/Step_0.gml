/// @description Insert description here
// You can write your code in this editor
if(!global.israining){
	alarm[2] = 0;
	if(was_raining){
		alarm[0]=60;
		was_raining=false;
	}
}else{
	was_raining = true;
}

var partsys = part_system_create();
if(global.israining && !is_not_top()){
	part_particles_burst(partsys,random_range(bbox_left,bbox_right),y,rain);
}

if(global.winddir == "left"){
	x-=1;
}else{
	x+=1;
}

if(bbox_right<=0 || bbox_left>=1920){
	instance_destroy();
}
