// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_occupy_nodes(){
	var occuList = obj_vehicle.occupyList; 
	
	ds_list_clear(occuList);
	for( var kk = 0; kk < map_width; kk++){
		var tempNode = map[kk, advanceNumber];
		ds_list_add(occuList, tempNode);
		tempNode.occupant = obj_vehicle;
		tempNode.pushNode = false;
		
		var nextNode = map[kk, advanceNumber + 1];
		nextNode.pushNode = true;
		
	}
}

