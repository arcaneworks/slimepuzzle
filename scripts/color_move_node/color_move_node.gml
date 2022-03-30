function color_move_node(argument0, argument1) {
	//argument0 - node ID to color
	//argument1 - selectedActor's move

	var node, move;


	node = argument0;
	move = argument1; 

	if (ds_list_empty(node.targeted)) {
	
		node.color = c_aqua;
	
	} else {
	
		node.color = c_purple;
	
	}



	// could add more here if we want to color the 
	// nodes in a more complex way





}
