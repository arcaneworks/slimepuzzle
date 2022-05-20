event_inherited();

if(incapacitated){
	color = c_black;
	alpha = .5;
}else{
	color = c_white;
	alpha = 1;
}

if(gridX != noone && gridY != noone){
	if(map[gridX, gridY].occupant == id){
		if(map[gridX, gridY].terrain != noone && map[gridX, gridY].terrain.terrainString == "HOLE"){
			color = c_gray; 	
			
		}else{
			color = c_white;		
		}	
	}	
}


if(obj_interface_editor.selectedComponent == id){
	alpha = .5;	
}else{
	alpha = 1;	
	
}

if(faces){
	switch(facingDir){
		case dir.north:
			image_xscale = 1;
			var sprite = asset_get_index("spr_" + class + "_n");
			sprite_index = sprite;
			xOffset = 0;
		break;
	
		case dir.east:
			image_xscale = 1;
			var sprite = asset_get_index("spr_" + class + "_e");
			sprite_index = sprite;
			xOffset = 0;
		break;
	
		case dir.south:
			image_xscale = 1;
			var sprite = asset_get_index("spr_" + class + "_s");
			sprite_index = sprite;
			xOffset = 0;
		break;
	
		case dir.west:
			var sprite = asset_get_index("spr_" + class + "_w");
			
			if(sprite > -1){
				sprite_index = sprite;
				xOffset = 0;
			}else{
				image_xscale = -1;
				var sprite = asset_get_index("spr_" + class + "_e");
				sprite_index = sprite;
				xOffset = node_size;
			}
		break;

	}
}

