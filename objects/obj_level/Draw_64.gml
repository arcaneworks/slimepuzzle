var x1 = x + 500;
var y1 = y + 6;
var width = 144;
var height = 50;

var x2 = x1 + width;
var y2 = y1 + height;

draw_set_color(c_black);
draw_rectangle(x1, y1, x2, y2, false);

draw_set_color(c_yellow);
draw_rectangle(x1, y1, x2, y2, true);


draw_set_color(c_white);

draw_set_font(f_battle_text_20);
var stringWidth = string_width(guiString);
var stringHeight = string_height(guiString);

var stringY = y1 + .5 * height - .5 * stringHeight + 2;
var stringX = x1 + .5 * width - .5 * stringWidth;

draw_text(stringX, stringY, guiString);

draw_set_font(f_battle_text);