// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mb_press_act(){
	// check if the mouse is currently over a node, and that it can be acted on.
	if(hoverNode != noone && hoverNode.actionNode){	
		// check for button press
		if(select_pressed() || movement_pressed() ){
			
			var tempStruct = snap_deep_copy(selectedActor.componentStruct);
			copy_component_to_struct(selectedActor, tempStruct);
			global.totalMoves++;
			ds_priority_add(selectedActor.undoList, tempStruct, global.totalMoves);
			
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
			selectedActor.canAct = false;
			//selectedActor.changeDir = true;
			if(ds_stack_top(obj_undo.moveStack) == id){
				ds_stack_pop(obj_undo.moveStack);			
			}
			
			ds_priority_add(global.actionQueue, selectedActor,selectedActor.SPD);
			with(obj_enemy){
					canAct = true;
			}
		
		}
	
	}
}