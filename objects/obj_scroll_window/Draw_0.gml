/// @description Insert description here
// You can write your code in this editor

//draw_self();
draw_rectangle_color(x, y, x+ width - 2, y + height - 2, c_black, c_black, c_black, c_black, false);
draw_resizable_ext(spr_frame, x, y, width, height, 0, 0);
draw_text_outlined(x + .5 * width - .5 * string_width(title), y - 15, title, c_white, c_black);
