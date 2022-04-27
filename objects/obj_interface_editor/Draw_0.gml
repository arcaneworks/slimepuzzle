

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