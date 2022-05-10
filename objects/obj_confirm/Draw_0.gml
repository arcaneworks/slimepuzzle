draw_default();
draw_set_font(f_battle_text_28);
draw_rectangle_color(x, y, x + width - 2, y + height -2, c_black, c_black, c_black, c_black, false);
draw_resizable_ext(sprite_index, x, y, width, height, 0, 0);

draw_text_ext_transformed(x + buffer + 5, y + buffer, textString, string_height(textString) * textScale + 13, width/textScale - buffer, textScale, textScale, 0); 


if(decision){
	var dec1 = "YES";
	var dec2 = "NO";
	
	draw_rectangle_color(decBox1X, decBox1Y, decBox1X + decBoxW - 2, decBox1Y + decBoxH + 4,
	decBox1Color,decBox1Color,decBox1Color,decBox1Color,false);
	draw_resizable_ext(spr_frame, decBox1X, decBox1Y, decBoxW, decBoxH, 0, 0);
	
	draw_text_transformed(decBox1X + .5 * decBoxW - .5 * string_width(dec1) * textScale, decBox1Y + .5 * decBoxH - 3,
	dec1, textScale, textScale, 0);
	
	draw_rectangle_color( decBox2X, decBox2Y, decBox2X + decBoxW - 2, decBox2Y + decBoxH + 4, 
	decBox2Color,decBox2Color,decBox2Color,decBox2Color,false);
	draw_resizable_ext(spr_frame, decBox2X, decBox2Y, decBoxW, decBoxH, 0, 0);
	
	draw_text_transformed(decBox2X + .5 * decBoxW - .5 * string_width(dec2) * textScale, decBox2Y + .5 * decBoxH -3,
	dec2, textScale, textScale, 0);
	
	
}else{
	var dec = "CONFIRM";
	draw_rectangle_color(decBoxX, decBoxY, decBoxX + decBoxW - 2, decBoxY + decBoxH + 4, 
	decBoxColor,decBoxColor,decBoxColor,decBoxColor,false);
	draw_resizable_ext(spr_frame, decBoxX, decBoxY, decBoxW, decBoxH, 0, 0);
	draw_text_transformed(decBox2X + .5 * decBoxW - .5 * string_width(dec) * textScale, decBox2Y + .5 * decBoxH,
	dec, textScale, textScale, 0);
	
}


draw_default();
