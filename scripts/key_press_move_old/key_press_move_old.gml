// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function key_press_move_old(){
	
	var actor = selectedActor;   //actor is selectedComponet
	var oNodeX = actor.gridX; // origin nodeX
	var oNodeY = actor.gridY;// origin nodeY
	var tempDir = noone;
	var tempY = noone;
	var lBound = 0; //boundry on left side of map
	var rBound = map_width - 1; //right side
	var bBound = 0; //bottom side
	var tBound = map_height; //top side
	prevNode = map[oNodeX, oNodeY];

	//-------------------------------------------------------IF PRESS UP
	if(keyboard_check_released(vk_anykey)){
	
		if(keyboard_check_released(vk_up)){ //if the player presses UP
			tempDir = dir.north;	
			var tempY = oNodeY + 1;
			if(tempY <= tBound){ // if node north of actor is on the map
			
				var tempTarget = map[oNodeX, tempY]; // target that node
				if(tempTarget.occupant == noone){ // if that node has no occupant
				
					if(!tempTarget.targetNode){
						wipe_nodes();
						
					
						tempTarget.targetNode = true; //then makes THIS node targetable
						
									
					
					
					}else{ //if you press the input on the target node AGAIN
					
						selectedActor.moveToNode = tempTarget; 
				
						//send selectedActor on its way 
						state = "nothing";
	
						selectedActor.moveState = "start path";
					
						wipe_nodes();
				
					}
				}
			}	
		}
	
		if(keyboard_check_released(vk_down)){ //if the player presses UP
			
			var tempY = oNodeY - 1;
			tempDir = dir.south;
			if(tempY >= bBound){ // if node north of actor is on the map
			
				 var tempTarget = map[oNodeX, tempY]; // target that node
			
				if(tempTarget.occupant == noone){ // if that node has no occupant
				
					if(!tempTarget.targetNode){
					
						wipe_nodes();
						tempTarget.targetNode = true; 	
					
						
					
					}else{
						selectedActor.moveToNode = tempTarget; 
						//send selectedActor on its way 
						state = "nothing";
	
						selectedActor.moveState = "start path";
						wipe_nodes();
				
					}
				}
			}	
		}
	
		if(keyboard_check_released(vk_left)){ //if the player presses UP
			var tempX = oNodeX - 1;
			tempDir = dir.west;
			
			if(tempX >= lBound){ // if node north of actor is on the map
			
				 var tempTarget = map[tempX, oNodeY]; // target that node

				
					if(!tempTarget.targetNode){
					
						wipe_nodes();
						tempTarget.targetNode = true; 	
						
					}else{
						selectedActor.moveToNode = tempTarget; 
			
						//send selectedActor on its way 
						state = "nothing";
	
						selectedActor.moveState = "start path";
						wipe_nodes();
				
					}
				
			}	
		}
	
		if(keyboard_check_released(vk_right)){ //if the player presses UP
			
			var tempX = oNodeX + 1;
			tempDir = dir.east;
			if(tempX <= rBound){ // if node north of actor is on the map
			
				 var tempTarget = map[tempX, oNodeY]; // target that node
			
				if(tempTarget.occupant == noone){ // if that node has no occupant
				
					if(!tempTarget.targetNode){
						wipe_nodes();
					
						tempTarget.targetNode = true; 
						
						
						
					}else{
						selectedActor.moveToNode = tempTarget; 
			
						//send selectedActor on its way 
						state = "nothing";
	
						selectedActor.moveState = "start path";
						wipe_nodes();
				
					}
				}
			}	
		}
		
		if(tempDir >= 0){
			actor.facingDir = tempDir; 
			//actor.changeDir = true;	
		}
	
	}
	
}