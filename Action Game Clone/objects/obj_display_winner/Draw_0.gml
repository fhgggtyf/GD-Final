/// @description Insert description here
// You can write your code in this editor
if(room == rm_winner){
	x=0.5*room_width;
	y = 0.5*room_height;
	if(global.winner == 1){
		draw_sprite(spr_p1_win,0,200,250);
		draw_sprite(spr_batman_won,0,room_width/2,room_height/2)
	}
	else{
		draw_sprite(spr_p2_win,0,room_width - 200,250);
		draw_sprite(spr_superman_won,0,room_width/2,room_height/2)
	}
}