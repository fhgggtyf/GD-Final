/// @description Insert description here
// You can write your code in this editor
//var left_score = global._score[0];  
//var right_score = global._score[1]; 

//draw_set_font(fnt_score); 

//draw_set_halign(fa_left);
//draw_set_valign(fa_top);

//draw_set_color(c_black);
//draw_text(10, 10, string(left_score));

//draw_set_halign(fa_right);

//draw_set_color(c_red);
//draw_text(display_get_gui_width() - 10, 10, string(right_score));

//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
//draw_set_font(-1); 

// Define screen dimensions
var screen_width = display_get_gui_width();
var screen_height = display_get_gui_height();

// Define container dimensions
var container_width = 500;
var container_height = 50;

// Define positions for the health bars
var left_x = 200;
var left_y = 100;
var right_x = screen_width - container_width - 200;
var right_y = 100;

// Colors for the health bar
var container_color = c_black; // Border color
var fill_color_left = c_grey;   // Health bar color (left)
var fill_color_right = c_red; // Health bar color (right)

// Border thickness
var border_thickness = 0;

// Draw left health bar container (outline)
for(var i = 0; i < 10; i++){
	draw_rectangle_color(left_x - border_thickness-i, left_y - border_thickness-i, 
    left_x + container_width + border_thickness+i, left_y + container_height + border_thickness+i, 
    container_color, container_color, container_color, container_color,false);
}

// Fill the left health bar based on percentage1
var left_fill_width = container_width * percentage1;
draw_set_color(fill_color_left);
draw_rectangle(left_x, left_y, left_x + left_fill_width, left_y + container_height, false);

	
// Draw right health bar container (outline)
for(var i = 0; i < 10; i++){
	draw_rectangle_color(right_x - border_thickness-i, right_y - border_thickness-i, 
    right_x + container_width + border_thickness+i, right_y + container_height + border_thickness+i, 
    container_color, container_color, container_color, container_color,false);
}

// Fill the right health bar based on percentage2
var right_fill_width = container_width * percentage2;
draw_set_color(fill_color_right);
draw_rectangle(right_x + (container_width - right_fill_width), right_y, 
    right_x + container_width, right_y + container_height, false);
	
draw_sprite(spr_p1_icon, 0,100,50);
draw_sprite(spr_p2_icon, 0,screen_width-200,50);