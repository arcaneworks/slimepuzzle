draw_set_font(font);
strScale = .5;
strHeight = string_height(level) * strScale;
strWidth = string_width(level) * strScale;

numString = string(levelSlot);

numHeight = string_height(numString) * textScale; 
numWidth = string_width(numString) * textScale;



if(hovered || selected){
		var textX = x + .5 * sprite_width - .5 * strWidth/2;
		var textY = y - strHeight/2 - 3;
		draw_text_transformed_color(textX + 1, textY + 1, level, strScale/2, strScale/2, 0, c_black,c_black,c_black,c_black,1);
		draw_text_transformed(textX, textY, level, strScale/2, strScale/2, 0);
	}




draw_default();

