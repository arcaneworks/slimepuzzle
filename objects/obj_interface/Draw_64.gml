//draw_sprite(sprite_index,cursorImg, mouse_x+ x_offset, mouse_y + y_offset);
if(global.gameObj.debugMode){
	var debugList = ds_list_create();


	ds_list_add(debugList, "interface state: " + state);
	ds_list_add(debugList, "counter" + string(global.gameObj.matt));
 
	if(hoverNode != noone){
		if(hoverNode.onScreen){
			ds_list_add(debugList, "ONSCREEN"); 
			
			if(hoverNode.terrain != noone){
				ds_list_add(debugList, "TERRAIN " + hoverNode.terrain.terrainString); 
			}
		}
	
		if(hoverNode.occupant && hoverNode.occupant != noone){
		
			var a = hoverNode.occupant;
			var s = " ";
		
			ds_list_add(debugList,"object:" + s + a.class, "actState" + s + a.actState, "game action state" + s + global.gameObj.actionState,);
		
			if(hoverNode.occupant == global.gameObj.currActor){
			
				ds_list_add(debugList, "CURRENT ACTOR");
			
			}
		
		if(hoverNode.occupant.incapacitated){
				ds_list_add(debugList, "incapacitated");	
			}else{
				ds_list_add(debugList, "not incapacitated");
			}
		
		
		}
	
	}
	var sActor = "selected actor: "
	if(selectedActor != noone){
		ds_list_add(debugList, sActor + selectedActor.class);
		
	}else{
		ds_list_add(debugList, sActor + "NOOONE");
	}
	draw_set_font(f_battle_text_28);
	var textScale = .2;
	ds_list_draw_transformed(debugList,mouse_x + sprite_width, mouse_y, textScale, true);
	ds_list_destroy(debugList);
}