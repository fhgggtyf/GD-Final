/// @description Insert description here
// You can write your code in this editor
// Check if the mouse is over the button sprite
if (position_meeting(mouse_x, mouse_y, self)) {
    // Check if the left mouse button is pressed
    if (mouse_check_button_pressed(mb_left)) {
        audio_play_sound(snd_click_button,1,false);
		room_goto(rm_game);
    }
	else{
		image_index = 1;
	}
}
else{
	image_index = 0;
}