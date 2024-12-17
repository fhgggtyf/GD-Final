/// @description Insert description here
// You can write your code in this editor

if (!audio_is_playing(global.bgm)) {
    global.bgm = audio_play_sound(snd_bgm, 1, true); // Play music (looping = true)
}