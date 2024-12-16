/// @description Insert description here
// You can write your code in this editor
x=random(room_width);
y=room_height;
vspeed=-100;
hspeed=random_range(-150,150);
image_index=0;
init = true;
audio_play_sound(snd_spawn,0,false);
respawn_wait = false;