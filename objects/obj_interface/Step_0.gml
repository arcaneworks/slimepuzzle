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
						if(selectedActor.canAct)
							action_nodes(map[selectedActor.gridX, selectedActor.gridY], selectedActor.action.targeting.targetType, selectedActor.action.targeting.range);
						movement_nodes(map[selectedActor.gridX, selectedActor.gridY], selectedActor.move)	
					}
					
					if(hoverNode != noone && hoverNode.moveNode)
						mb_press_move();
					else if(hoverNode != noone && hoverNode.actionNode)
						mb_press_act();
					else
						select_other();
					//move_reaction_ui();
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
				
				//action_target_ui();
				
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

	