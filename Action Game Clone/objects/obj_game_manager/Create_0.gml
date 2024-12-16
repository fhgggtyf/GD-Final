/// @description Insert description here
// You can write your code in this editor
randomize();

global._score = [1, 1];
gravity = 9.8;

alarm[0]=irandom_range(120,400);

planes = [obj_airplane,obj_airplane_spiderman];

shaking = false;
global.shake_x=0;
global.shake_y=0;

player1=instance_find(obj_player_1,0);
player2=instance_find(obj_player_2,0);
health_bar = instance_find(obj_score_counter,0);

function screen_shake(alarm_time = 30){
	shaking = true;
	alarm[1] = alarm_time;
}