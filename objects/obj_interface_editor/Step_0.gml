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
				
				if(obj_sub_toolbar_write.visible){
					obj_sub_toolbar_write.visible = false;				
				}
				
				step_move_components_assign();	
				step_tool_select();		
			
			break;
			
			case "move2":
				cursorSprite = spr_move_cursor;
				step_move_relocate();
				step_tool_select();
			break; 
			
			
			case "idle":
				if(obj_sub_toolbar_write.visible){
					obj_sub_toolbar_write.visible = false;				
				}
				step_tool_select();
			
			break;
			
			case "write":
				
				if(!obj_sub_toolbar_write.visible){
					obj_sub_toolbar_write.visible = true;				
				}
				if(mouse_check_button_pressed(mb_right)){
					state = "idle";
					selectedTool = noone;
					selectedObjTool = noone;

				}
				
				step_tool_select();
				
				step_tab_select();
				
				step_object_select();
		
				step_object_place();
				
			break;
			
			case "delete":
				cursorSprite = spr_delete_cursor;
				if(obj_sub_toolbar_write.visible){
					obj_sub_toolbar_write.visible = false;				
				}
					
				step_delete();
				step_tool_select();
			
			break;
			
			
			case "save":
				
				save_CG_set(obj_level_editor.level);
				
				if(obj_sub_toolbar_write.visible){
					obj_sub_toolbar_write.visible = false;				
				}
				step_tool_select();
				
				state = "move";
				selectedTool = noone;
			
			break; 
			
			
			case "saveas":
				if(obj_sub_toolbar_write.visible){
					obj_sub_toolbar_write.visible = false;				
				}
				step_tool_select();
				input = get_string_async("Name your map.", auto_gen_mapname(working_directory + "levels/*", "level")); 
				state = "idle"
			
			break;
			
			
			case "load":
				instance_activate_object(obj_level_load_menu);
				if(obj_sub_toolbar_write.visible){
					obj_sub_toolbar_write.visible = false;				
				}
				step_tool_select();
				
			break;
			

		}
	
	#endregion

	