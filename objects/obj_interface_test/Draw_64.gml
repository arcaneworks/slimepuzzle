draw_sprite(sprite_index,cursorImg, device_mouse_x_to_gui(0)+ x_offset, device_mouse_y_to_gui(0) + y_offset);
if(obj_test_game.debugMode){
	var debugList = ds_list_create();

	draw_text(device_mouse_x_to_gui(0) + sprite_width, device_mouse_y_to_gui(0), "standby queue" + string(ds_queue_size(global.gameObj.actionQueue)));
	draw_text(device_mouse_x_to_gui(0) + sprite_width, device_mouse_y_to_gui(0) + 25, "game phase: " + global.gameObj.phase);

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
	ds_list_draw(debugList,device_mouse_x_to_gui(0) + sprite_width, device_mouse_y_to_gui(0) + 50, 0, 20, false);
	ds_list_destroy(debugList);
}