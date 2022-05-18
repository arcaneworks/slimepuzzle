function wipe_nodes_range_info() {
	//resets all nodes; removes all of the node pathfinding data and associated color change
	with(obj_node){
		moveNode = false;
		targetable = false;
		//actionNode = false;
		G = 0;
		parent = noone;
		if (ds_list_empty(targeted)) {
		
			color = c_white;
		
		} else {
		
			color = c_yellow;
		
		}	
	
	}


}
