

function step_interface_select() {

	if(hoverNode && hoverNode.occupant && hoverNode.occupant.agent){ // if you're hovering over a node...
		
		if(hoverNode.occupant && hoverNode.occupant.canMove && selectedActor == noone){
			wipe_nodes();
			move_nodes(map[gridX, gridY]); 
			
		}else{
			wipe_nodes();	
		}
		
	if(hoverNode.occupant.canMove || hoverNode.occupant.canAct){
		if(mouse_check_button_pressed(mb_left) && clickAble){ //... and you've clicked...
			//... on an component who can act/move in the current suphase... 
			audio_play_sound(s_select, 1, false);
			selectedActor = hoverNode.occupant; // make that dude the selected component
			selectedActor.selected = true;
				
			if(!selectedActor.canMove && selectedActor.canAct){
				state = "action target";
				getTargets = true;
			}else{
				
				state = "move";
				move_nodes(map[selectedActor.gridX, selectedActor.gridY], selectedActor.move);
			
			}
		}
	}
	}else{
		wipe_nodes();	
	}

}
