/// @description Insert description here
// You can write your code in this editor
if (dmg_mod != 0) {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 1.5, 1.5, 0, c_yellow, 0.5); // Larger, transparent glow
}

draw_self();

if (array_length(trail_positions) != 0) {
    // Set the sprite to draw
    var spr = sprite_index;
    var subimage = image_index;

    // Draw the trail with decreasing alpha
    for (var i = 0; i < array_length(trail_positions); i++) {
        var pos = trail_positions[i][0];
        var t = i / trail_length; // Normalized value between 0 and 1
        
        // Calculate the alpha using lerp (fade from 1 to 0)
        var alpha = lerp(1, 0, t);
        
        draw_set_alpha(alpha);
        draw_sprite_ext(spr, trail_positions[i][2], pos[0], pos[1], trail_positions[i][1], 1, 0, c_white, alpha);
    }

    // Reset alpha to full opacity
    draw_set_alpha(1);
}