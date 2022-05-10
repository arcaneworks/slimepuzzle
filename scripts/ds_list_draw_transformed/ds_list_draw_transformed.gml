//draws a ds list full of strings. offsets the Y position of every value by string height. 
function ds_list_draw_transformed(list, posX, posY, textScale, shadow){
	
	var tempString = ds_list_find_value(list, 0);
	var stringHeight = string_height(tempString);
	var textBuffer = 0;
	var yOffset = stringHeight * textScale + textBuffer; 
	var shadowAlpha = .5;
	if(shadow){
		for(var i = 0; i < ds_list_size(list); i++){
			var item = ds_list_find_value(list, i);
			draw_set_color(c_black);
			draw_set_alpha(shadowAlpha);
			draw_text_transformed(posX, posY + i * yOffset + 1 , item, textScale, textScale, 0);
		
			draw_set_color(c_white);
			draw_set_alpha(1);
			draw_text_transformed(posX, posY + i * yOffset , item, textScale, textScale, 0);
		}
	}else{
		for(var i = 0; i < ds_list_size(list); i++){
			var item = ds_list_find_value(list, i);
			draw_text_transformed(posX, posY + i * yOffset , item, textScale, textScale, 0);
		}
	}
}



