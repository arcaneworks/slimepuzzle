guiString = room_get_name(room);
draw_set_font(f_battle_text_28);
var x1 = xstart;
var y1 = ystart;
var textScale = .35; 
var stringWidth = string_width(guiString) * textScale;
var stringHeight = string_height(guiString) * textScale;
if(stringWidth > width){
	width = stringWidth;	
}
var x2 = x1 + width;
var y2 = y1 + height;
 


var stringY = y1 + .5 * height - .5 * stringHeight + 3;
var stringX = x1 + .5 * width - .5 * stringWidth;

draw_set_color(c_black);
draw_rectangle(x1, y1, x2, y2, false);

draw_set_color(c_yellow);
draw_rectangle(x1, y1, x2, y2, true);

draw_set_color(c_white);
var gameobj = global.gameObj;


draw_text_transformed(stringX, stringY, guiString, textScale, textScale, 0);
guiString = global.gameObj.levelString;

y1 += height + 4;

var x2 = x1 + width;
var y2 = y1 + height;

draw_set_color(c_black);
draw_rectangle(x1, y1, x2, y2, false);
draw_set_color(c_yellow);
draw_rectangle(x1, y1, x2, y2, true);
draw_set_color(c_white);
var stringWidth = string_width(guiString) * textScale;
var stringHeight = string_height(guiString) * textScale;

var stringY = y1 + .5 * height - .5 * stringHeight + 3;
var stringX = x1 + .5 * width - .5 * stringWidth;

draw_text_transformed(stringX, stringY, guiString, textScale, textScale, 0);

draw_default();
