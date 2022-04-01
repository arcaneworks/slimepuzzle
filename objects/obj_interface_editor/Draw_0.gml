draw_sprite_ext(cursorSprite,cursorImg, x, y , 1, 1, 0, c_white, 1 );

if(hoverTool != noone){
	draw_set_font(f_battle_text_small);
	draw_text(hoverTool.x - 5, hoverTool.y - 10, hoverTool.toolType);	
	draw_set_font(f_battle_text);
}

if(selectedObjTool != noone){
	draw_sprite_ext(selectedObjTool.sprite_index, selectedObjTool.image_index, x + 20, y, 1, 1, 0, c_white, .75);
	
}

//if(hoverObjTool != noone){
//	draw_text(x + 20, y, "hover object tool");
//}

if(selectedObj != noone){
	draw_sprite_ext(selectedObj.sprite_index, selectedObj.image_index, x + 20, y, 1, 1, 0, c_white, 1);
	
}

//if(hoverNode != noone){
//	if(hoverNode.componentCode != noone){
//		draw_text( x - 10, y, hoverNode.componentCode);	
		
//	}
	
//}


if(prevNode != noone){
	if(prevNode.occupant != noone){
		draw_sprite_ext(prevNode.occupant.sprite_index, prevNode.occupant.image_index, prevNode.x, prevNode.y, 1, 1, 0, c_white, .5)
	}

}