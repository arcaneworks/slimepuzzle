///this is where most of the UI stuff happens. movement nodes, targeting, ect. 
if(initialize){
	selectedTool = obj_toolbar.move; 
	initialize = false; 
}

	#region mode set functions
	function set_mode_move(check = false){
		cursorSprite = spr_move_cursor;
		step_move_components_assign();	
		step_tool_select(check);		
	}
	function set_mode_move2(check = false){
			cursorSprite = spr_move_cursor;
			step_move_relocate();
			step_tool_select(check);
	}
	function set_mode_write(check = false){
				step_tool_select(check);
				step_tab_select();
				step_object_select();
				step_object_place();
				step_object_rotate();
	}
	function set_mode_delete(check = false){
				cursorSprite = spr_delete_cursor;	
				step_delete();
				step_tool_select(check);	
	}
	function set_mode_save(){
		if(confirmDec == true){
			save_CG_set(obj_level_editor.level);
				
			state = "move";
			selectedTool = noone;
			confirmDec = noone;
					
		}else{
			if(confirmDec == false){
				state = "move";
				selectedTool = noone;
				confirmDec = noone;
					
			}	
		}
	}
	function set_mode_save_as(check = false){
		if(!instance_exists(obj_saveas)){
			instance_create_layer(x, y, "Instances", obj_saveas);	
		}
		step_tool_select(check);
			
	}
	function set_mode_load(check = false){
				if(!instance_exists(obj_scroll_load_box)){
					instance_create_layer(x, y, "Instances", obj_scroll_load_box);	
				}
				
				step_tool_select(check);
	}
	#endregion

	#region hotkey selectors
	if(move_hotkey_pressed()){
		hoverTool = obj_toolbar.move;
		set_mode_move(true);
	}
	
	if(write_hotkey_pressed()){
		hoverTool = obj_toolbar.write;
		set_mode_write(true);
	}
	if(delete_hotkey_pressed()){
		hoverTool = obj_toolbar.deleteTool;
		set_mode_delete(true);
	}
	#endregion
update_cursor_pos();
	
	
	#region	CUSTORSTATE SWITCH STATEMENT

		switch(state){
			
			case "move":
				set_mode_move();
				break;
			case "move2":
				set_mode_move2();
				break; 
			case "idle":
				step_tool_select();
				break;
			case "write":
				set_mode_write();
				break;
			case "delete":
				set_mode_delete();
				break;
			case "save":
				set_mode_save();
				break; 
			case "saveas":
				set_mode_save_as();
				break;
			case "load":
				set_mode_load();
				break;
		}
	
	#endregion

	
