draw_default();
/// @description Insert description here
// You can write your code in this editor
draw_set_font(f_battle_text_28);
var textScale = .4;
var title = "FILE NAME";
if(!saveNoti){
	
	draw_set_valign(fa_top);

	draw_rectangle_color(x, y, x + width - 2, y + height - 1, color, color, color, color, false);
	draw_resizable_ext(spr_frame, x, y,width, height, 0, 0)
	draw_text_transformed(x,y - string_height(title) * textScale - 5, title,c_white,c_black, 1);


	var startX = x + width;
	var endX = x + width * 1.5;
	var startY = y; 
	var endY = y + height;
	var text = "SAVE";
	var stringWidth = string_width(text)* textScale;
	var stringHeight = string_height(text)*  textScale;
	draw_rectangle_color(startX,startY, endX - 2, endY - 1, saveColor, saveColor, saveColor, saveColor, false);
	draw_resizable_ext(spr_frame, startX, startY, width/2, height, 0, 0)
	draw_text_transformed(startX + .5 * width/2 - .5 * stringWidth,startY + .5 * height - .5 * stringHeight + 2, text,textScale,textScale, 0);



	//var startX = endX;
	//var endX = startX + width/2;
	//var startY = y; 
	//var endY = y + height;
	//var text = "CANCEL";
	//var stringWidth = string_width(text)* textScale;
	//var stringHeight = string_height(text)*  textScale;
	//draw_rectangle_color(startX, startY, endX - 1, endY - 1, cancelColor, cancelColor, cancelColor, cancelColor, false);
	//draw_resizable_ext(spr_frame, startX, startY, endX - startX, height, 0, 0)
	//draw_text_transformed(startX + .5 * width/2 - .5 * stringWidth,startY + .5 * height - .5 * stringHeight + 2, text,textScale,textScale, 0);



	draw_text_transformed(x + 7,y+ 10,message + cursor, textScale, textScale, 0);
	draw_set_valign(fa_top);
}else{
	draw_text_shadow(x, y, "STAGE SAVED!", c_lime, c_black, .15);
	
}
