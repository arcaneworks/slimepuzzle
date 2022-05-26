// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mb_press_move(){
	if(hoverNode != noone && hoverNode.occupant == noone &&  hoverNode.moveNode){			
		
		if(mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1)){
			
			
			 var tempStruct = snap_deep_copy(selectedActor.componentStruct);
			
			copy_component_to_struct(selectedActor, tempStruct);
			global.totalMoves++;
			ds_priority_add(selectedActor.undoList, tempStruct, global.totalMoves);
			
			var sComp = selectedActor;
			
			selectedActor.moveToNode = hoverNode;
			
			var actX = selectedActor.gridX;
			var actY = selectedActor.gridY;
			var targX = hoverNode.gridX;
			var targY = hoverNode.gridY;
			var xDiff = actX - targX;
			var yDiff = actY - targY;
				
				if(yDiff < 0)
					sComp.facingDir = dir.north;
				else 
					sComp.facingDir = dir.south;
					
			if (xDiff > 0 )
				sComp.facingDir = dir.west;
			else if (xDiff < 0)
				sComp.facingDir = dir.east;

			state= "nothing";
			sComp.moveState = "start path";
			wipe_nodes();
		
		}
	
	}
	
	
}