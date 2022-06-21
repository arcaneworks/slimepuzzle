draw_rectangle_color(x, y, x + width - 1, y +height - 1, c_black, c_black, c_black, c_black, false);
draw_resizable_ext(bgSprite,x, y, width, height, 0, 0);

draw_set_font(font);

var text = "STAGE LIST";
var textScale = .23;

var textHeight = string_height(text) * textScale; 

var stageBoxX = levelLoadBox.x + levelLoadBox.width + 20;
var stageBoxY = y; 

var stageBoxWidth = 150;
var stageBoxHeight = height * .5;

var textBuffer = textHeight; 
draw_rectangle_color(stageBoxX, stageBoxY, stageBoxX + stageBoxWidth - 1, stageBoxY + stageBoxHeight - 1, c_black, c_black, c_black, c_black, false);
draw_resizable_ext(spr_frame, stageBoxX, stageBoxY, stageBoxWidth, stageBoxHeight, 0, 0);

var titleTextScale = .4;

draw_text_transformed(stageBoxX + .5 * stageBoxWidth - .5 * string_width(text) * titleTextScale, y - textHeight *2, text, titleTextScale, titleTextScale, 0);

for(var kk = 0; kk < ds_list_size(drawList); kk++){
	var level = ds_list_find_value(drawList, kk);
	var num = ds_list_find_value(levelNumbers, kk);
	var halfPoint = floor(ds_list_size(drawList)/2);
	
	if(kk >= halfPoint){
		var xx = stageBoxX + 5 + stageBoxWidth/2;  
		var yy = stageBoxY + ((kk) mod halfPoint) * textHeight;
	}else{
		var xx = stageBoxX + 5;
		var yy = stageBoxY + kk * textHeight;
	}
	draw_text_transformed(xx + 5, yy + 5, num, textScale, textScale, 0 );
	draw_text_transformed(xx + 20, yy + 5, level, textScale, textScale, 0 );
	
}

//if(ds_list_size(drawList) > 0){
//	ds_list_draw(levelNumbers, stageBoxX + 5, stageBoxY + 5, 0, textBuffer, false, textScale);
//	ds_list_draw(drawList, stageBoxX + 25, stageBoxY + 5, 0, textBuffer, false, textScale);
	
//}

draw_default();

