///this is where most of the UI stuff happens. movement nodes, targeting, ect. 
if(initialize){
	selectedTool = obj_toolbar.move; 
	initialize = false; 
}

update_cursor_pos();
	
	
	#region	CUSTORSTATE SWITCH STATEMENT

		switch(state){
			
			case "move":
				cursorSprite = spr_move_cursor;
				step_move_components_assign();	
				step_tool_select();		
			
			break;
			
			case "move2":

				cursorSprite = spr_move_cursor;
				step_move_relocate();
				step_tool_select();
			break; 
			
			
			case "idle":

				step_tool_select();
			
			break;
			
			case "write":

				
				step_tool_select();
				
				step_tab_select();
				
				step_object_select();
		
				step_object_place();
				
			break;
			
			case "delete":
				cursorSprite = spr_delete_cursor;
					
				step_delete();
				step_tool_select();
			
			break;
			
			
			case "save":
				//create_confirm_box(x, y, width, height, text, choice
				save_CG_set(obj_level_editor.level);
				step_tool_select();
				
				state = "move";
				selectedTool = noone;
			
			break; 
			
			
			case "saveas":
			
				if(!instance_exists(obj_saveas)){
					instance_create_layer(x, y, "Instances", obj_saveas);	
				}
				step_tool_select();
				state = "idle";
			
			break;
			
			
			case "load":

				if(!instance_exists(obj_scroll_load_box)){
					instance_create_layer(x, y, "Instances", obj_scroll_load_box);	
				}
				
				step_tool_select();
				
			break;
			

		}
	
	#endregion

	