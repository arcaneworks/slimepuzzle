
	if(obj_sub_toolbar_write.visible == false){
		visible = false;	
		hoverable = false;
		solid = false;
	}else{
		if(obj_sub_toolbar_write.selectedTab.tabType == tabType){
			visible = true;
			solid = true;
			hoverable = true;
		}else{
			hoverable = false;
			visible = false; 	
			solid = false;	
		}
	}


if(mouse_over() || obj_sub_toolbar_write.selectedObjTool == id){
	hovered = true;
}else{
	hovered = false;
	
}

if(class != noone){
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
if(class == "breakable"){
	image_index = 1;	
	
}
	
}
