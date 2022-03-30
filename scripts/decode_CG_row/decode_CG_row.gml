// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function decode_CG_row(rowIndex){
	
	for (var col = 0; col < liveMapWidth; col++) {
		
		var nodeInfo = map[col][rowIndex];
		var node = ds_queue_dequeue(freshNodes); // freshNodes contains nodes ready to be recycled
		map[col][rowIndex] = node;
		
		// init nodes from left to right in this row
		node.gridX = col; 
		node.gridY = rowIndex;
		node.x = mapOrgX + col * node_size;
		node.y = mapOrgY - ((rowIndex + 1) * node_size);
		
		
		decode_node_info_new(nodeInfo, node);
		// decode nodeInfo and update node accordingly
				
	}
	
}

/*
see updates to these events: 
	test_game step (advance finish part) 
	test_game create
see the following scripts:
	update_caravan_pos
	init_CG_decoding_key
	create_nodes_NEW
	init_populate_map
	load_CG_set
	clear_node
	preload_CG
	decode_CG_row
	decode_node_info
	
	
also need to add an instance variable 'facingDir' to the component parent object