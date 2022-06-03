

function step_interface_select() {

	if(hoverNode && hoverNode.occupant){ // if you're hovering over a node...
		if(hoverNode.occupant.agent){
			if(hoverNode.occupant && hoverNode.occupant.canMove && selectedActor == noone){
				wipe_nodes();
				if(hoverNode.occupant.canAct)
							action_nodes(map[hoverNode.occupant.gridX, hoverNode.occupant.gridY], hoverNode.occupant.action.targeting.targetType, hoverNode.occupant.action.targeting.range);
						
				movement_nodes(map[hoverNode.occupant.gridX, hoverNode.occupant.gridY], hoverNode.occupant.move);
				
			}else{
				wipe_nodes();	
			}
		
			if(hoverNode.occupant.canMove || hoverNode.occupant.canAct){
				if((select_pressed() || shoulder_pressed()) && clickAble){ //... and you've clicked...
					//... on an component who can act/move in the current suphase... 
					
					audio_play_sound(s_select, 1, false);
					selectedActor = hoverNode.occupant; // make that dude the selected component
					//selectedActor.selected = true;
				
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
			
		
			var inst = hoverNode.occupant;
			var index = object_get_name(hoverNode.occupant.object_index);
		
			if(object_get_parent(hoverNode.occupant.object_index) == obj_enemy){
				wipe_nodes();
				var enemy = hoverNode.occupant;
				
				if(enemy.reacts){
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
function set_hovernode_char_select(){
	var tempNode = noone; 
	var shoulder = 0;
	if(right_shoulder_pressed() || left_shoulder_pressed()){
		shoulder += right_shoulder_pressed();
		shoulder -= left_shoulder_pressed();
		if(selectedActor != noone){
			tempNode = selectedActor.currNode;	
		}
		var actorNodes = ds_list_create();
		with (obj_agent){
			ds_list_add(actorNodes, currNode);
		}
		var actorLength = ds_list_size((actorNodes));
		for(var i = 0; i <actorLength; i++){
				if(tempNode == noone){
					var index =  (i+ shoulder);
					index = (index + actorLength) mod actorLength;
					var indexNode =ds_list_find_value(actorNodes,index);
					if(indexNode && indexNode.occupant ){
						if( indexNode.occupant.canAct || indexNode.occupant.canMove){
							hoverNode = indexNode ;
							selectedActor = noone;
						}
						else
						{
							tempNode = indexNode;
							if(shoulder< 0){
								i= (i + actorLength - 2	)%actorLength;
							}
							continue;
						}
						break;
					}
				
				}
				else if (tempNode == ds_list_find_value(actorNodes,i)){
					
					var index =  (i+ shoulder);
					index = (index + actorLength) mod actorLength;
					var indexNode =ds_list_find_value(actorNodes,index);
					if(indexNode != noone && indexNode.occupant != noone ){
						if(indexNode.occupant.canAct || indexNode.occupant.canMove)
							hoverNode = indexNode;
						else{
							tempNode = indexNode;
							if(shoulder< 0){
								i= (i + actorLength - 2	)%actorLength;
							}
							continue;
							
							}
					
						break;
					}
				}
		}
		ds_list_destroy(actorNodes);
	}
}

function set_hovernode_movement(){
	if(selectedActor && movement_pressed()){
			var axisH = 0;
			var axisV = 0;
			axisV = axisV + up_pressed() - down_pressed();
			axisH = axisH + right_pressed() - left_pressed();
			if( axisH != 0|| axisV != 0){
				var startX = selectedActor.gridX;
				var startY = selectedActor.gridY;
				
				if(startX + axisH >=0 && startX + axisH < map_width&& startY + axisV >= 0 && startY + axisV < map_height)
					hoverNode = map[startX + axisH, startY + axisV];
				var i = 1;
				if(hoverNode != noone)
				while( !hoverNode.actionNode && !hoverNode.moveNode){
					var tempAxisH = i * axisH;
					var tempAxisY = i * axisV;
					var gridX = startX + tempAxisH;
					var gridY = startY + tempAxisY;
					if(gridX <0 || gridX >= map_width)
						break;
					if(gridY <0 || gridY >= map_height)
						break;
					hoverNode = map[gridX, gridY];
					i++;
					
				}
				
			}
		
	}
	
}
