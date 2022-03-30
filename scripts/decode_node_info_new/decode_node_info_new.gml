// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function decode_node_info_new(nodeInfo, nodeID){
	// decodes the information contained in a string (nodeInfo) and modifies a clean node
	// (nodeID) accordingly. Returns the component occupying the node.
	
	var object = noone; 
	var component = noone;
	var terrain = noone;
	
	if (string_length(nodeInfo) >= 2) { // object info is in the first character position
		
		var char1 = string_char_at(nodeInfo, 1); // get first character
		var char2 = string_char_at(nodeInfo, 2);
		
		if(char1 == "C"){
			var objectID = ds_map_find_value(componentCodes, char2); // decode character
			var component = instance_create_layer(nodeID.x, nodeID.y, "Instances", objectID); // create instance
			component.gridX = nodeID.gridX; 
			component.gridY = nodeID.gridY; 
			nodeID.occupant = component; 
		}else{
			if(char1 == "T"){
				var objectID = ds_map_find_value(terrainCodes, char2); // decode character
				var terrain = instance_create_layer(nodeID.x, nodeID.y, "Instances", objectID);
				terrain.gridX = nodeID.gridX; 
				terrain.gridY = nodeID.gridY;
				nodeID.terrain = terrain; 
			}
			
			if(char1 == "E"){
				var objectID = ds_map_find_value(elementCodes, char2); // decode character
				var element = instance_create_layer(nodeID.x, nodeID.y, "Instances", objectID); // create instance
				element.gridX = nodeID.gridX; 
				element.gridY = nodeID.gridY; 
				nodeID.occupant = element; 			
			}
		}
		
		if(string_length(nodeInfo) >= 4){
			
			var char3 = string_char_at(nodeInfo, 3);
			var char4 = string_char_at(nodeInfo, 4);
			
			if(char3 == "T"){
				var objectID = ds_map_find_value(terrainCodes, char4); // decode character
				var terrain = instance_create_layer(nodeID.x, nodeID.y, "Instances", objectID);
				terrain.gridX = nodeID.gridX; 
				terrain.gridY = nodeID.gridY;
				nodeID.terrain = terrain; 
			}	
		}
	} 
	
	
	return object; // returns node

}