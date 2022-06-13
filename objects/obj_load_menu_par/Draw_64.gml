/// @description Insert description here
// You can write your code in this editor
event_inherited();	
draw_default();

draw_set_font(f_battle_text_28);


draw_text_transformed(x + .5 * width - .5 * string_width(title) *textScale, y - string_height(title) * textScale, title, textScale, textScale, 0);
draw_default();

if (firstVisObjId > ds_list_size(objs) - 1) {

	var error = true;
}

for(ii = 0; ii < ds_list_size(visObjs); ii ++){
	var tempText = filename_name(ds_list_find_value(visObjs, ii));
	
	
	draw_set_color(textColor);
	draw_set_font(f_battle_text_28);
	
	var xOffset =  borderX;
	var yOffset =  borderY + ii *(objHeight);
	draw_text_transformed(x + xOffset, y + yOffset, tempText, textScale, textScale, 0); 
	draw_set_color(c_white);
	if (mpos != -1) {
		draw_sprite(spr_selection_arrow, 0, x + sprite_get_width(spr_selection_arrow) * 1.1, y + sprite_get_height(spr_selection_arrow)  * .5 + 2 + mpos * objHeight);
		
		if(selected != noone){
		
		draw_set_color(c_aqua);
		draw_set_alpha(.05);
		draw_rectangle(x + borderX , y + borderY - 2 + mpos * (objHeight), x + borderX + string_width(selected) * textScale, y + borderY + mpos * objHeight + string_height(selected) * textScale - 2, false);
		draw_set_alpha(1);
		draw_set_color(c_white);
	}
	}
	
	
}

draw_default();/// @description Insert description here
// You can write your code in this editor
