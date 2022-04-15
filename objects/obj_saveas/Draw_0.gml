/// @description Insert description here
// You can write your code in this editor
<<<<<<< Updated upstream
draw_self();
=======

>>>>>>> Stashed changes
draw_set_valign(fa_top);

draw_rectangle_color(x, y, x + width - 2, y + height - 1, color, color, color, color, false);
draw_resizable_ext(spr_frame, x, y,width, height, 0, 0)
draw_text_shadow(x,y - 10, "File Name",c_white,c_black, 1);


var startX = x;
var endX = x + width/2;
var startY = y + height; 
var endY = y + height * 2;
var text = "SAVE";
var stringWidth = string_width(text);
var stringHeight = string_height(text);
draw_rectangle_color(startX,startY, endX - 2, endY - 1, saveColor, saveColor, saveColor, saveColor, false);
draw_resizable_ext(spr_frame, startX, startY, width/2, height, 0, 0)
draw_text_shadow(startX + .5 * width/2 - .5 * stringWidth,startY + .5 * height - .5 * stringHeight + 2, text,c_white,c_black, 1);



var startX = x + width/2;
var endX = x + width;
var startY = y + height; 
var endY = y + height * 2;
var text = "CANCEL";
var stringWidth = string_width(text);
var stringHeight = string_height(text);
draw_rectangle_color(x + width/2, y + height, x + width - 2, y + height * 2 - 1, cancelColor, cancelColor, cancelColor, cancelColor, false);
draw_resizable_ext(spr_frame, x + width/2, y + height, width/2, height, 0, 0)
draw_text_shadow(startX + .5 * width/2 - .5 * stringWidth,startY + .5 * height - .5 * stringHeight + 2, text,c_white,c_black, 1);



draw_text(x + 7,y+ 10,message + cursor);
draw_set_valign(fa_top);