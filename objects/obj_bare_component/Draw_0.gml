if(hovered){
	draw_sprite_outlined(sprite_index, image_index, x + xOffset, y , image_xscale, 1, 0, color, outlineCol, alpha);
}else{
	draw_sprite_ext(sprite_index, image_index, x+ xOffset, y , image_xscale, 1, 0, color, alpha);	
}

