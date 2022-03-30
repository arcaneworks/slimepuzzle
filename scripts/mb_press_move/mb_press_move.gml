// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mb_press_move(){
	if(hoverNode != noone && hoverNode.occupant == noone &&  hoverNode.moveNode){			
		
		if(mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1)){
			
			var sComp = selectedActor;
		
			sComp.prevNode = map[selectedActor.gridX, selectedActor.gridY];
			selectedActor.moveToNode = hoverNode;
			
			
			//send selectedActor on its way 
			
			state= "nothing";
			sComp.moveState = "start path";
			ds_stack_push(obj_undo.moveStack, sComp);
			//sComp.changeDir = true;
			wipe_nodes();
		
		}
	
	}
	
	
}