// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function key_press_act(){
	
	var actor = selectedActor;   //actor is selectedComponet
	var range = actor.action.targeting.range;
	var oNodeX = actor.gridX; // origin nodeX
	var oNodeY = actor.gridY;// origin nodeY
	var tempDir = noone;
	var tempTarget = noone;
	var fState = "action standby"; //state that the actor goes into;
	var encQueue = global.actionQueue;
	var execute = false;
	
	var lBound = 0; //boundry on left side of map
	var rBound = map_width - 1; //right side
	var bBound = 0; //bottom side
	var tBound = map_height; //top side


	var potNodes = ds_list_create();  //potential hit nodes in a givin direction
	
	for(var ii = 0; ii < ds_list_size(dirNodes); ii++){
		var templist = ds_list_find_value(dirNodes, ii);
		ds_list_add(potNodes, templist);
		
	}

	//-------------------------------------------------------IF PRESS UP
		
		if(keyboard_check_pressed(vk_up)){ //if the player presses UP, searches for first occupant in range
			wipe_nodes();
			actableNodes = ds_list_find_value(potNodes, dir.north);
			tempDir = dir.north;
			for(var kk = 0; kk < ds_list_size(actableNodes); kk++){
				var tNode = ds_list_find_value(actableNodes, kk);
				//tNode.potNode = true;
			} 
		}	 
		
		if(keyboard_check_pressed(vk_down)){ //if the player presses UP
			wipe_nodes();
			actableNodes = ds_list_find_value(potNodes, dir.south);	
			tempDir = dir.south;
			for(var kk = 0; kk < ds_list_size(actableNodes); kk++){
				var tNode = ds_list_find_value(actableNodes, kk);
				//tNode.potNode = true;
			} 	
		}

		if(keyboard_check_pressed(vk_left)){ //if the player presses UP
			wipe_nodes();
			actableNodes = ds_list_find_value(potNodes, dir.west);
			tempDir = dir.west;
			for(var kk = 0; kk < ds_list_size(actableNodes); kk++){
				var tNode = ds_list_find_value(actableNodes, kk);
				//tNode.potNode = true;
			} 
		}


		if(keyboard_check_pressed(vk_right)){ //if the player presses UP
			wipe_nodes();
			actableNodes = ds_list_find_value(potNodes, dir.east);
			tempDir = dir.east;
			for(var kk = 0; kk < ds_list_size(actableNodes); kk++){
				var tNode = ds_list_find_value(actableNodes, kk);
				//tNode.potNode = true;
			} 
		}
			
		if(keyboard_check_pressed(ord("Z"))){
			if(actableNodes != noone && ds_list_size(actableNodes) > 0){
					
				with(instance_create_layer(x, y, "Instances", obj_actionevent)){
					eventNodes = other.actableNodes;
					targOptionCt = ds_list_size(eventNodes);
					eventActor = other.selectedActor;
					//key = vk_up;
					eventType = eventActor.action.actionEvent.eventType;
				}			
				state = "action event";
				
			}
		
		}

		if(tempDir >= 0){
			prevDir = actor.facingDir;
			actor.facingDir = tempDir; 
		}
		
	
	
	ds_list_destroy(potNodes);
	
	
}

