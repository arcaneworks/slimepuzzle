//draw_sprite(sprite_index,cursorImg, mouse_x+ x_offset, mouse_y + y_offset);
if(obj_test_game.debugMode){
	var debugList = ds_list_create();

	draw_text(mouse_x + sprite_width, mouse_y, "standby queue" + string(ds_queue_size(global.gameObj.actionQueue)));
	draw_text(mouse_x + sprite_width, mouse_y + 25, "game phase: " + global.gameObj.phase);

	ds_list_add(debugList, "interface state: " + state);
	ds_list_add(debugList, "counter" + string(obj_test_game.matt));
 
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
		
			ds_list_add(debugList,"object:" + s + a.class, "actState" + s + a.actState, "game action state" + s + obj_test_game.actionState,);
		
			if(hoverNode.occupant == obj_test_game.currActor){
			
				ds_list_add(debugList, "CURRENT ACTOR");
			
			}
		
		if(hoverNode.occupant.incapacitated){
				ds_list_add(debugList, "incapacitated");	
			}else{
				ds_list_add(debugList, "not incapacitated");
			}
		
		
		}
	
	}
	ds_list_draw(debugList,mouse_x + sprite_width, mouse_y + 50, 0, 20, false);
	ds_list_destroy(debugList);
}