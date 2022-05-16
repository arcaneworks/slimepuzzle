///this is where most of the UI stuff happens. movement nodes, targeting, ect. 

update_cursor_pos();
	
	
	#region	CUSTORSTATE SWITCH STATEMENT

		switch(state){
			
			case "idle":
				step_interface_select();
			break;

			case "move":	
			
				if(selectedActor != noone){
					
					if(getMoves){
						movement_nodes(map[selectedActor.gridX, selectedActor.gridY], selectedActor.move)	
					}
					
					mb_press_move();
					select_other();
					move_reaction_ui();
					var aStruct = selectedActor.action;
					
					if(selectedActor.canAct && keyboard_check_released(aStruct.info.hotKey)){
						wipe_nodes();
						action_nodes(map[selectedActor.gridX, selectedActor.gridY], aStruct.targeting.targetType, aStruct.targeting.range);
						state = "action target";	
					}	
					
					cancel_key_check_idle();
				}
				
				
				
			break;	
			
			case "action target":
				if(getTargets){
					var aStruct = selectedActor.action;
					wipe_nodes();
					action_nodes(map[selectedActor.gridX, selectedActor.gridY], aStruct.targeting.targetType, aStruct.targeting.range);	
					getTargets = false;
				}
						
				
				select_other();
				
				mb_press_act();
				
				if(selectedActor.canMove){
					cancel_key_check_move();
				}else{
					cancel_key_check_idle();	
				}
				
				

			break;
			
			
			//case "action event":
			
			//break;
			
			case "clear":
				ds_list_clear_inner_lists(dirNodes);
				ds_list_clear_inner_lists(moveNodes);
				actableNodes = noone;
				state = nextState;
			break;


		}
	
	#endregion

	