

function step_interface_select() {

	if(hoverNode && hoverNode.occupant){ // if you're hovering over a node...
		if(hoverNode.occupant.agent){
			if(hoverNode.occupant && hoverNode.occupant.canMove && selectedActor == noone){
				wipe_nodes();
				if(hoverNode.occupant.canAct)
							action_nodes(map[hoverNode.occupant.gridX, hoverNode.occupant.gridY], hoverNode.occupant.action.targeting.targetType, hoverNode.occupant.action.targeting.range);
						
				movement_nodes(map[gridX, gridY], hoverNode.occupant.move);
				
			}else{
				wipe_nodes();	
			}
		
			if(hoverNode.occupant.canMove || hoverNode.occupant.canAct){
				if(mouse_check_button_pressed(mb_left)  || gamepad_button_check(0,gp_face1) && clickAble){ //... and you've clicked...
					//... on an component who can act/move in the current suphase... 
					audio_play_sound(s_select, 1, false);
					selectedActor = hoverNode.occupant; // make that dude the selected component
					selectedActor.selected = true;
				
					if(!selectedActor.canMove && selectedActor.canAct){
						state = "action target";
						getTargets = true;
					}else if(selectedActor.canMove){
				
						state = "move";
						if(selectedActor.canAct)
							action_nodes(map[selectedActor.gridX, selectedActor.gridY], selectedActor.action.targeting.targetType, selectedActor.action.targeting.range);
						
						movement_nodes(map[selectedActor.gridX, selectedActor.gridY], selectedActor.move);
			
					}
				}
			}
		}else{
			if(hoverNode.occupant != noone && hoverNode.occupant.enemy){
				wipe_nodes();
				var enemy = hoverNode.occupant;
				
				if(enemy.hasReaction){
					if(!ds_list_empty(enemy.reactList)){
						for(var ii = 0; ii < ds_list_size(enemy.reactList); ii++){
							var reactNode = ds_list_find_value(enemy.reactList, ii); 
							reactNode.actionNode = true;
						
						}
					}
				}	
			}
		}
	}else{
		wipe_nodes();	
	}

}
