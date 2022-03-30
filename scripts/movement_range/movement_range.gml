///@param originNode
///@param moveRange
function movement_nodes(originNode, moveRange) {


	//argument0 - origin node, the node to pathfind from
	//argument1 - units movement range


	//reset all node data
	wipe_nodes_range_info();


	var processing, destNodes, throughNodes;
	var start, current, neighbor;
	var tempG, range, costMod;

	//declare relevant variables from arguments
	start = argument0;
	range = argument1;

	//create data structures
	processing = ds_priority_create();
	destNodes = ds_list_create(); // list of nodes the actor can move TO (end of path)

	//add starting node to processing list
	ds_priority_add(processing, start, start.G);


	//while processing queue is NOT empty...
	//repeat the following untill ALl nodes have been looked at
	while(ds_priority_size(processing) > 0) {
		//remove node with the lowest G score from processing
		current = ds_priority_delete_min(processing);
	
		// add node to destNodes list 
	    ds_list_add(destNodes, current);

		//step through all of current's neighbors
		for(ii = 0; ii < ds_list_size(current.neighbors); ii ++){
			//store current neighbor in neighbor variable
			neighbor = ds_list_find_value(current.neighbors, ii);
		
			//add neighbor to processing list if it qualifies
			//what qualifies? :
			//neighbor is passable 
			//neighbor has no occupant
			//neighbor's projected G score is less than movement range
			//neighbor isn't on destNodes list
		
			if(ds_list_find_index(destNodes, neighbor) < 0 && // node is not already in destNodes list
								  neighbor.passable && // node is passable
								  (neighbor.occupant == noone || neighbor.occupant.agent) && // node is unoccupied OR occupied by ally
								  neighbor.cost + current.G <= range){
								  //neighbor.gridY - orgNode.gridY <= obj_caravan.slack) { // node is within range
			
				if(ds_priority_find_priority(processing, neighbor) == 0 || ds_priority_find_priority(processing, neighbor) == undefined){
					costMod = 1;
				
					//give neighbor the appropriate parent
					neighbor.parent = current;
				
					//if node is diagonal, create appropriate costMod
					if(neighbor.gridX != current.gridX && neighbor.gridY != current.gridY){
						costMod = 2;
					}
				
					//calculate G score of neighbor, with costMod in place
				
					neighbor.G = current.G + (neighbor.cost * costMod);
				
					//add neigbor to the processing list so it can be checked
					ds_priority_add(processing, neighbor, neighbor.G);
				
				//ELSE 
				//if neighbor's score has already been calced for the processing list
				}else{
					//figure out if the neighbor's score would be lower if found from the current node!
					costMod = 1;
				
					//if node is diagonal, create appropriate costMod
					if(neighbor.gridX != current.gridX && neighbor.gridY != current.gridY){
						costMod = 2;
					}
				
					tempG = current.G + (neighbor.cost * costMod);
				
					//check if G score would be lower
					if(tempG < neighbor.G){
						neighbor.parent = current;
						neighbor.G = tempG;
						ds_priority_change_priority(processing, neighbor, neighbor.G);
					}
				
				}
		
			}	
		
		}
	
	}

	//round down all G scores for movement calculations!
	with(obj_node){
		G = floor(G);
	
	}


	//ALWAYS DESTROY - NO LEAKES
	ds_priority_destroy(processing);

	//color all the move nodes then destroy destNodes list

	for(ii = 0; ii < ds_list_size(destNodes); ii += 1){
		current = ds_list_find_value(destNodes, ii);
		if (current.occupant == noone) { // check whether this node is occupied (by an ally)
			current.moveNode = true;
			color_move_node(current, argument1);
		}
	}





	start.moveNode = false;


	//destroy destNodes list!!
	ds_list_destroy(destNodes);



}
