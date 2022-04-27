/// @description Insert description here
// You can write your code in this editor
event_inherited();	
draw_default();


var borderY = 10;
var borderX = 20;

if (firstVisObjId > ds_list_size(objs) - 1) {

	var error = true;
}

for(ii = 0; ii < ds_list_size(visObjs); ii ++){
	var tempText = filename_name(ds_list_find_value(visObjs, ii));
	var xOffset =  borderX;
	var yOffset =  borderY + (ii * objHeight)
	draw_text_color(x + xOffset, y + yOffset, tempText, textColor, textColor, textColor, textColor, 1); 
	
	if (mpos != -1) {
		draw_sprite(spr_selection_arrow, 0, x + sprite_get_width(spr_selection_arrow) * 1.1, y + 14 + mpos * objHeight);
	}
	
	if(selected != noone){
		
		draw_set_color(c_aqua);
		draw_set_alpha(.05);
		draw_rectangle(x + borderX , y + borderY - 4 + mpos * objHeight, x + borderX + string_width(selected), y + borderY + mpos * objHeight + string_height(selected), false);
		draw_set_alpha(1);
		draw_set_color(c_white);
	}
}

draw_default();/// @description Insert description here
// You can write your code in this editor
