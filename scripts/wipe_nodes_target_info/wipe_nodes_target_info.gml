function wipe_nodes_target_info() {
	//resets all nodes; removes all of the node pathfinding data and associated color change
	with(obj_node){
		ds_list_clear(targeted);
		color = c_white; 
	}


}
