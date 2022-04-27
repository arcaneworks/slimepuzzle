var guiString = "TEST ROOM"
draw_set_font(f_battle_text_10);
var x1 =  30;
var y1 =  6;
var width = 105;
var height = 35;
var x2 = x1 + width;
var y2 = y1 + height;

draw_set_color(c_black);
draw_rectangle(x1, y1, x2, y2, false);

draw_set_color(c_yellow);
draw_rectangle(x1, y1, x2, y2, true);

draw_set_color(c_white);

var stringWidth = string_width(guiString);
var stringHeight = string_height(guiString);

var stringY = y1 + .5 * height - .5 * stringHeight + 4;
var stringX = x1 + .5 * width - .5 * stringWidth;

draw_text(stringX, stringY, guiString);
var guiString = global.testTarget;
draw_set_font(f_battle_text_10);

y1 += height + 4;

var x2 = x1 + width;
var y2 = y1 + height;

draw_set_color(c_black);
draw_rectangle(x1, y1, x2, y2, false);

draw_set_color(c_yellow);
draw_rectangle(x1, y1, x2, y2, true);

draw_set_color(c_white);


var stringWidth = string_width(guiString);
var stringHeight = string_height(guiString);

var stringY = y1 + .5 * height - .5 * stringHeight + 4;
var stringX = x1 + .5 * width - .5 * stringWidth;

draw_text(stringX, stringY, guiString);

draw_set_font(f_battle_text);