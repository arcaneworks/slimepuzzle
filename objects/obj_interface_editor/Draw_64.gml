draw_sprite_ext(cursorSprite,cursorImg, x, y , 1, 1, 0, c_white, 1 );

if(hoverTool != noone){
	draw_set_font(f_battle_text_small);
	var text = hoverTool.toolType;
	var textWidth = string_width(text); 
	var textHeight = string_height(text);
	//var sprite = hoverTool.sprite_index;
	var spriteHeight = hoverTool.sprite_height;
	//var spriteWidth = hoverTool.sprite_width;
	var xx = hoverTool.x - textWidth - 5;
	var yy = hoverTool.y + spriteHeight;
	var bgColor = c_black;
	var textScale = .3;
	
	draw_rectangle_color(xx - 3, yy, xx + textWidth + 3, yy + textHeight, bgColor, bgColor, bgColor, bgColor, false)
	draw_set_font(f_battle_text_28);
	draw_set_color(c_yellow);
	draw_text_transformed(xx, yy + 3, text, textScale, textScale,0);	
	
	
	draw_set_color(c_white);
}

if(selectedObjTool != noone){
	draw_sprite_ext(selectedObjTool.sprite_index, selectedObjTool.image_index, x + 20 + selectedObjTool.xOffset, y, selectedObjTool.image_xscale, 1, 0, c_white, .75);
	
}

//if(hoverObjTool != noone){
//	draw_text(x + 20, y, "hover object tool");
//}

if(selectedObj != noone){
	draw_sprite_ext(selectedObj.sprite_index, selectedObj.image_index, x + 20, y, 1, 1, 0, c_white, 1);
	
}//draw_sprite(sprite_index,cursorImg, mouse_x+ x_offset, mouse_y + y_offset);
if(obj_level_editor.debugMode){
	var debugList = ds_list_create();
	
	if(hoverNode != noone){
		if(hoverNode.occupant != noone){
			ds_list_add(debugList, "OCCUPANT EXISTS");
			
		}else{
			ds_list_add(debugList, "OCCUPANT = NOONE");
			
		}
		if(hoverNode.componentCode != noone){
			ds_list_add(debugList, "COMPONENT CODE = " + hoverNode.componentCode);
			
		}else{
		  ds_list_add(debugList, "COMPONENT CODE = NOONE");
		}
		
		if(hoverNode.terrain != noone){
			ds_list_add(debugList, "TERRAIN EXISTS");
			
		}else{
			ds_list_add(debugList, "TERRAIN = NOONE");
			
		}
		
		if(hoverNode.terrainCode != noone){
			ds_list_add(debugList, "TERRAIN CODE = " + hoverNode.terrainCode);
			
		}else{
		  ds_list_add(debugList, "TERRAIN CODE = NOONE");
		}
		
		
		
	}
	
	if(ds_list_size(debugList) > 0){
		draw_set_font(f_battle_text_28);
		var textScale = .3;
		ds_list_draw_transformed(debugList,mouse_x + sprite_width, mouse_y, textScale, true);
	}
	ds_list_destroy(debugList);
	draw_default();
}
draw_default();

