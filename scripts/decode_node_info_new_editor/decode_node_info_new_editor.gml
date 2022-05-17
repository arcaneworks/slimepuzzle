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
		if(char1 == "C" || char1 == "E"){
			if(char1 == "C"){
				var dsMap = componentCodes;	
			}else{
				var dsMap = elementCodes;	
			}
			var objectID = ds_map_find_value(dsMap, char2); // decode character
			show_debug_message(objectID);
			var component = instance_create_layer(nodeID.x, nodeID.y, "Instances", obj_bare_component); // create instance
			component.componentCode = char1 + char2;
			component.sprite_index = object_get_sprite(objectID)
			get_component_info(component, component.componentCode); 
			component.gridX = nodeID.gridX; 
			component.gridY = nodeID.gridY; 
			nodeID.occupant = component; 
			nodeID.componentCode = char1 + char2;
			if(component.faces){
				var dirStr = string_char_at(nodeInfo, 3);
				if(dirStr != "T" && dirStr != ""){
					nodeID.componentCode += dirStr;
					component.facingDir = real(string_char_at(nodeInfo, 3));
				}
			}
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

		}
		
		if(string_length(nodeInfo) >= 4){
			
			if(component.faces){
				var terrChar1Pos = 4;
				var terrChar2Pos = 5;
			}else{
				var terrChar1Pos = 3;
				var terrChar2Pos = 4;
			}
					
			
			var terrChar1 = string_char_at(nodeInfo, terrChar1Pos);
			var terrChar2 = string_char_at(nodeInfo, terrChar2Pos);
			
			if(terrChar1Pos == "T"){
				var objectID = ds_map_find_value(terrainCodes,terrChar2); // decode character
				var terrain = instance_create_layer(nodeID.x, nodeID.y, "Instances", obj_bare_terrain);
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