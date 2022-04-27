// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function decode_node_info_new_editor(nodeInfo, nodeID){
	// decodes the information contained in a string (nodeInfo) and modifies a clean node
	// (nodeID) accordingly. Returns the component occupying the node.
	
	var object = noone; 
	var component = noone;
	var terrain = noone;
	
	if (string_length(nodeInfo) >= 2) { // object info is in the first character position
		
		var char1 = string_char_at(nodeInfo, 1); // get first character
		var char2 = string_char_at(nodeInfo, 2);
		show_debug_message(char1);
		show_debug_message(char2);
		if(char1 == "C"){
			var objectID = ds_map_find_value(componentCodes, char2); // decode character
			show_debug_message(objectID);
			var component = instance_create_layer(nodeID.x, nodeID.y, "Instances", obj_bare_component); // create instance
			component.componentCode = char1 + char2;
			component.sprite_index = object_get_sprite(objectID)
			get_component_info(component, component.componentCode); 
			component.gridX = nodeID.gridX; 
			component.gridY = nodeID.gridY; 
			nodeID.occupant = component; 
			nodeID.componentCode = char1 + char2;
		}else{
			if(char1 == "T"){
				var objectID = ds_map_find_value(terrainCodes, char2); // decode character
				var terrain = instance_create_layer(nodeID.x, nodeID.y, "Instances", obj_bare_terrain);
				
				terrain.terrainCode = char1 + char2;
				terrain.sprite_index = object_get_sprite(objectID);
				terrain.gridX = nodeID.gridX; 
				terrain.gridY = nodeID.gridY;
				nodeID.terrain = terrain; 
				nodeID.terrainCode = char1 + char2;
			}
			
			if(char1 == "E"){
				var objectID = ds_map_find_value(elementCodes, char2); // decode character
				var element = instance_create_layer(nodeID.x, nodeID.y, "Instances", obj_bare_element); // create instance
				element.componentCode = char1 + char2;
				get_component_info(element, element.componentCode); 
				element.sprite_index = object_get_sprite(objectID);
				element.gridX = nodeID.gridX; 
				element.gridY = nodeID.gridY; 
				nodeID.occupant = element; 	
				nodeID.componentCode = char1 + char2;
			}
		}
		
		if(string_length(nodeInfo) >= 4){
			
			var char3 = string_char_at(nodeInfo, 3);
			var char4 = string_char_at(nodeInfo, 4);
			
			if(char3 == "T"){
				var objectID = ds_map_find_value(terrainCodes, char4); // decode character
				var terrain = instance_create_layer(nodeID.x, nodeID.y, "Instances", obj_bare_terrain);
				terrain.componentCode = char2;
				terrain.sprite_index = object_get_sprite(objectID);
				terrain.gridX = nodeID.gridX; 
				terrain.gridY = nodeID.gridY;
				nodeID.terrain = terrain; 
				nodeID.componentCode = char2;
			}	
		}
	} 
	
	
	return object; // returns node

}