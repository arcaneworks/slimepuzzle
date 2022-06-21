draw_rectangle_color(x, y, x + width - 1, y +height - 1, c_black, c_black, c_black, c_black, false);
draw_resizable_ext(bgSprite,x, y, width, height, 0, 0);

draw_set_font(font);

var text = "STAGE LIST";
var textScale = .23;

var textHeight = string_height(text) * textScale; 

var stageBoxX = levelLoadBox.x + levelLoadBox.width + 20;
var stageBoxY = y; 

var stageBoxWidth = 100;
var stageBoxHeight = height;

var textBuffer = textHeight; 
draw_rectangle_color(stageBoxX, stageBoxY, stageBoxX + stageBoxWidth - 1, stageBoxY + stageBoxHeight - 1, c_black, c_black, c_black, c_black, false);
draw_resizable_ext(spr_frame, stageBoxX, stageBoxY, stageBoxWidth, stageBoxHeight, 0, 0);

var titleTextScale = .4;

draw_text_transformed(stageBoxX + .5 * stageBoxWidth - .5 * string_width(text) * titleTextScale, y - textHeight *2, text, titleTextScale, titleTextScale, 0);



if(ds_list_size(drawList) > 0){
	ds_list_draw(drawList, stageBoxX + 10, stageBoxY + 10, 0, textBuffer, false, textScale);
	
}

draw_default();

