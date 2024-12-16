/// @description Insert description here
// You can write your code in this editor
if(global.israining){
	bg_id = layer_background_get_id("Background");
	layer_background_change(bg_id,spr_bg_raining);
}
else{
	bg_id = layer_background_get_id("Background")
	layer_background_change(bg_id,spr_bg);
}

if(shaking){
	// Random offsets based on intensity
    global.shake_x = random_range(-sqr(alarm_get(1))/10, sqr(alarm_get(1))/10);
    global.shake_y = random_range(-sqr(alarm_get(1))/10, sqr(alarm_get(1))/10);
}
else{
	global.shake_x=0;
	global.shake_y=0;
}

if(player1._health > 0 && player2._health > 0){
	health_bar.percentage1 = player1._health/500;
	health_bar.percentage2 = player2._health/500;
}
else{
	if(player1._health<=0)
	{
		global.winner = 2;
	}
	else
	{
		global.winner = 1;
	}
	room_goto(rm_winner);
		
}



