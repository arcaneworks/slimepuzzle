// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mb_press_act(){
	if(hoverNode != noone && hoverNode.actionNode){			
		
		if(mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1)){
			
			if(hoverNode.occupant){
				selectedActor.target = hoverNode.occupant
			
			}else{
				selectedActor.target = hoverNode;
			}
			
			ds_list_add(selectedActor.targetList, selectedActor.target);
			
			//if(hoverNode.gridX > sComp.gridX){
			//	sComp.facingDir = dir.east;	
			//}else{
			//	if(hoverNode.gridX < sComp.gridX){
			//		sComp.facingDir = dir.west;	
			//	}
			//}
			
			//if(hoverNode.gridY > sComp.gridY){
			//	sComp.facingDir = dir.north;	
			//}else{
			//	if(hoverNode.gridY < sComp.gridY){
			//		sComp.facingDir = dir.south;	
			//	}
			//}
			
			//send selectedActor on its way 
			wipe_nodes();
			state = "nothing";
			selectedActor.actState = "action standby";
			selectedActor.canAct = false;
			//selectedActor.changeDir = true;
			if(ds_stack_top(obj_undo.moveStack) == id){
				ds_stack_pop(obj_undo.moveStack);			
			}
			ds_queue_enqueue(global.gameObj.actionQueue, selectedActor);
			global.gameObj.actionState = "standby";
			
		
		}
	
	}
}