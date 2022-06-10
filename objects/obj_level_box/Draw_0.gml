draw_set_font(font);
strHeight = string_height(level) * textScale;
strWidth = string_width(level) * textScale;

numString = string(levelSlot);

numHeight = string_height(numString) * textScale; 
numWidth = string_width(numString) * textScale;




if(levelSlot > -1){
	draw_self();

	if(hovered){
		var textX = x + .5 * sprite_width - .5 * strWidth;
		var textY = y - strHeight - 3;
		draw_text_transformed_color(textX + 1, textY + 1, level, textScale, textScale, 0, c_black,c_black,c_black,c_black,1);
		draw_text_transformed(textX, textY, level, textScale, textScale, 0);
		
	
	}
	
	var numX = x + .5 * sprite_width - .5 * numWidth;
	var numY = y + .5 * sprite_height - .5 * numWidth;
	draw_text_transformed_color(numX + 1, numY + 1, numString, textScale, textScale, 0, c_black,c_black,c_black,c_black,1);
	draw_text_transformed(numX, numY, numString,  textScale, textScale, 0);
	
}

draw_default();

