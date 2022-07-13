///@param originNode
///@param moveRange
function movement_nodes(originNode, moveRange) {


	//argument0 - origin node, the node to pathfind from
	//argument1 - units movement range


	//reset all node data
	wipe_nodes_range_info();


	var processing, destNodes;
	var start, current, neighbor;
	var tempG, range, costMod;

	//declare relevant variables from arguments
	start = argument0;
	range = argument1;

	var diagonal = false;
	if( originNode.occupant != -4){
		diagonal = originNode.occupant.diagonal;
		}
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
					if(neighbor.terrain){
						//TODO activate this once info is implemented
						//costMod = neighbor.terrain.info.cost;
					}
					//if node is diagonal, create appropriate costMod
					if(neighbor.gridX != current.gridX && neighbor.gridY != current.gridY){
						if(diagonal)
						costMod = 1;
						else
						costMod = 2;
					}
				
					//calculate G score of neighbor, with costMod in place
				
					neighbor.G = current.G + (neighbor.cost * costMod);
					
					//add neigbor to the processing list so it can be checked
					if(neighbor.G<= range)
					ds_priority_add(processing, neighbor, neighbor.G);
				
				//ELSE 
				//if neighbor's score has already been calced for the processing list
				}else{
					//figure out if the neighbor's score would be lower if found from the current node!
					costMod = 1;
				
					//if node is diagonal, create appropriate costMod
					if(neighbor.gridX != current.gridX && neighbor.gridY != current.gridY){
						if(diagonal)
						costMod = 1;
						else
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
			current.actionNode = false;
			current.passNode = false;
			current.moveNode = true;
			color_move_node(current, argument1);
		}
	}





	start.moveNode = false;


	//destroy destNodes list!!
	ds_list_destroy(destNodes);



}

function path_to_node(originNode, moveRange, targetNode){
	//argument0 - origin node, the node to pathfind from
	//argument1 - units movement range


	//reset all node data
	wipe_nodes_range_info();


	var processing, destNodes, cameFrom, gScore;
	var start, current, neighbor, goal;
	var tempG, range, costMod;

	//declare relevant variables from arguments
	start = argument0;
	range = argument1;
	goal = argument2;

	var diagonal = false;
	if( originNode.occupant != -4){
		diagonal = originNode.occupant.diagonal;
	}
	//create data structures
	processing = ds_priority_create();
	cameFrom = ds_map_create();
	gScore = ds_map_create();
	ds_map_add(gScore, start, start.G);
	//fScore = ds_map_create();
	//ds_map_add(fScore, start, heuristic_function(start, goal));
	destNodes = ds_list_create(); // list of nodes the actor can move TO (end of path)
	//add starting node to processing list
	ds_priority_add(processing, start, heuristic_function(start,goal));
	//while processing queue is NOT empty...
	//repeat the following untill ALl nodes have been looked at
	while(ds_priority_size(processing) > 0) {
		//remove node with the lowest G score from processing
		current = ds_priority_delete_min(processing);
		if(current == goal)
			return reconstruct_path(cameFrom, current);
		//step through all of current's neighbors
		for(ii = 0; ii < ds_list_size(current.neighbors); ii ++){
			costMod = 1;
				
			var neighbor = ds_list_find_value(current.neighbors, ii);
					//give neighbor the appropriate parent
					neighbor.parent = current;
					if(neighbor.terrain){
						//TODO activate this once info is implemented
						//costMod = neighbor.terrain.info.cost;
					}
					//if node is diagonal, create appropriate costMod
					if(neighbor.gridX != current.gridX && neighbor.gridY != current.gridY){
						if(diagonal)
						costMod = 1;
						else
						costMod = 2;
					}
						if(neighbor.occupant != noone && neighbor != goal){
							costMod = 999999;	
						}
				
			var tentative_gScore = ds_map_find_value(gScore, current) + costMod * neighbor.cost;
			var tentative_fScore = tentative_gScore + heuristic_function(neighbor,goal);
			if(is_undefined(ds_map_find_value(gScore, neighbor)) ){
				if(ds_map_find_value(cameFrom,neighbor) == undefined 
				|| ds_map_find_value(gScore, ds_map_find_value(cameFrom,neighbor)) != undefined 
				&& ds_map_find_value(gScore, ds_map_find_value(cameFrom,neighbor))> tentative_gScore){
					
					var oldLink = ds_map_find_value(cameFrom,neighbor);
					if(oldLink != undefined)
						show_debug_message("Node: " + string(oldLink.gridX) + ", " + string(oldLink.gridY) + " link to Node: " + string(neighbor.gridX) + ", " + string(neighbor.gridY) + " replaced with link to Node: " + string (current.gridX) + ", " + string(current.gridY));
					else{
						show_debug_message( "Node: " + string(neighbor.gridX) + ", " + string(neighbor.gridY) + " linked to Node: " + string(current.gridX) + ", " + string(current.gridY));
					}
					ds_map_add(cameFrom,neighbor,current);	
				}
				ds_map_add(gScore,neighbor, tentative_gScore);
				if(is_undefined( ds_priority_find_priority(processing, neighbor))){
						ds_priority_add(processing, neighbor, tentative_fScore);
				}else if( ds_priority_find_priority(processing, neighbor) > tentative_fScore){
						ds_priority_change_priority(processing, neighbor, tentative_fScore);
				}
				
			}
			else if(ds_map_find_value(gScore, neighbor) > tentative_gScore){
				
				if(ds_map_find_value(cameFrom,neighbor) == undefined 
				|| ds_map_find_value( gScore,ds_map_find_value(cameFrom,neighbor)) != undefined 
				&& ds_map_find_value( gScore,ds_map_find_value(cameFrom,neighbor))> tentative_gScore){
					var oldLink = ds_map_find_value(cameFrom, neighbor);
					show_debug_message("Node: " + oldLink.gridX + ", " + oldLink.gridY + " link to Node: " + neighbor.gridX + ", " + neighbor.gridY + " replaced with link to Node: " + current.gridX + ", " + current.gridY);
					ds_map_replace(cameFrom, neighbor, current);
				}
				ds_map_replace(gScore, neighbor, tentative_gScore);
				if(is_undefined( ds_priority_find_priority(processing, neighbor))){
						ds_priority_add(processing, neighbor, tentative_fScore);
				}else if( ds_priority_find_priority(processing, neighbor) > tentative_fScore){
						ds_priority_change_priority(processing, neighbor, tentative_fScore);
				}
			}
		
		}
	
	}

	//round down all G scores for movement calculations!



	//ALWAYS DESTROY - NO LEAKES
	ds_priority_destroy(processing);
	
	//color all the move nodes then destroy destNodes list




	//destroy destNodes list!!
	ds_list_destroy(destNodes);
	ds_map_destroy(cameFrom);
	ds_map_destroy(gScore);


	
	
	
}
function reconstruct_path(cameFrom, current){
	var total_path = ds_list_create();
	var curNode = argument1;
	ds_list_add(total_path, current);
	show_debug_message("Reconstructing Path");
	
	var keys = ds_map_keys_to_array(cameFrom);
	var values = ds_map_values_to_array(cameFrom);
	var size = array_length(keys);
	var attempt = 0;
	for(var k = 0;k < size; k++)
	{
		var key = keys[k];
		var v = values[k];
		//show_debug_message("attempt " + string(attempt) + ", iteration " + string(k));
		show_debug_message("scanning node: " + string(key.gridX) + ", " + string(key.gridY) + " in search of node: " + string(curNode.gridX) + ", " + string(curNode.gridY) + " iteration " + string(k));
		if(key == curNode){
			ds_list_add(total_path, v);
			curNode = v;
			var s = "Node: " + string(v.gridX) + ", " + string(v.gridY) + " came from Node: " + string(key.gridX) + ", " + string(key.gridY);
			show_debug_message(s);
			k = -1;
			attempt ++;
		}
	}
	return total_path;
	
}
function heuristic_function(origin, target){
	var start = argument0;
	var goal = argument1;
	
	var xDif = abs( goal.gridX - start.gridX);
	var yDif = abs(goal.gridY - start.gridY);
	
	var pythag = sqrt(xDif * xDif + yDif * yDif);
	return pythag;
	
	
	
}