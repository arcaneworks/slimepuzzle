// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mb_press_act(){
	if(hoverNode != noone && hoverNode.actionNode){			
		
		if(mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1)){
			
			if(hoverNode.occupant){
				selectedActor.target = hoverNode.occupant;
				hoverNode.occupant.targetedBy = selectedActor;
			}else{
				selectedActor.target = hoverNode;
			}
			
			ds_list_add(selectedActor.targetList, selectedActor.target);
			
			if(hoverNode.gridX > selectedActor.gridX){
				selectedActor.facingDir = dir.east;	
			}else{
				if(hoverNode.gridX < selectedActor.gridX){
					selectedActor.facingDir = dir.west;	
				}
			}
			
			if(hoverNode.gridY > selectedActor.gridY){
				selectedActor.facingDir = dir.north;	
			}else{
				if(hoverNode.gridY < selectedActor.gridY){
					selectedActor.facingDir = dir.south;	
				}
			}
			
			//send selectedActor on its way 
			wipe_nodes();
			state = "nothing";
			selectedActor.actState = "action standby";
	
			//selectedActor.changeDir = true;
			if(ds_stack_top(obj_undo.moveStack) == id){
				ds_stack_pop(obj_undo.moveStack);			
			}
			
			ds_priority_add(global.actionQueue, selectedActor,selectedActor.SPD);
			
		
		}
	
	}
}