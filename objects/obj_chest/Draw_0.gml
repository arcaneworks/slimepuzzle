
switch(chestState){
	
	#region CLOSED
	
	case "closed":
	
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, color, alpha);
		
		if(hoverChest){
			image_index = 1
		}else{
			image_index = 0;
		}
	
	break;
	
	#endregion
	
	#region SHINE
	case "shine":
	
		if(hoverChest){
			draw_sprite_ext(spr_chest_shine_selected1,floor(img), chestX , chestY , 1, 1, 0, color, 1);
		}else{
			draw_sprite_ext(spr_chest_shine1,floor(img), chestX , chestY , 1, 1, 0, color, 1);
		}
		
	break;
	#endregion
	
	#region OPEN
	
		case "open":
	
			draw_sprite_ext(spr_chest_open1,floor(img), x , y , 1, 1, 0, color, 1);
	
		break;
		
	#endregion
	
	#region OPENED
	
		case "opened":
	
			draw_sprite_ext(spr_chest_open_still, img, chestX, chestY, xscale, yscale, rot, color, alpha);
		
		break;
	
	#endregion
	
	#region ITEM REVEAL
	
		case "item reveal":
			draw_set_alpha(alpha)
			draw_sprite_ext(spr_chest_open_still, img, chestX, chestY, xscale, yscale, rot, color, alpha);
			
			draw_sprite_ext(i_spr,i_img, i_x, i_y, i_xscale, i_yscale, i_rot, i_color, i_alpha);
		
	
		break;
	
	#endregion
	
	
	#region FADEOUT
	
		case "fadeout":
			draw_set_alpha(alpha)
			draw_sprite_ext(spr_chest_open_still, img, chestX, chestY, xscale, yscale, rot, color, alpha);
			
			draw_sprite_ext(i_spr,i_img, i_x, i_y, i_xscale, i_yscale, i_rot, i_color, i_alpha);
			draw_set_alpha(1);
	
		break;
	
	#endregion
	
	
}