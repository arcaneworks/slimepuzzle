// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function decode_node_info_new(nodeInfo, nodeID){
	// decodes the information contained in a string (nodeInfo) and modifies a clean node
	// (nodeID) accordingly. Returns the component occupying the node.
	
	var object = noone; 
	var component = noone;
	var terrain = noone;
	
	
	//C,E,T - there is a component,element or terrain in node    
	//? - code for object
	//
	
	
	if (string_length(nodeInfo) >= 2) { // object info is in the first character position
		
		var char1 = string_char_at(nodeInfo, 1); // get first character
		var char2 = string_char_at(nodeInfo, 2);
		
		if(char1 == "C" || char1 == "E"){
			
			if(char1 == "C"){
				var dsMap = componentCodes;	
			}else{
				var dsMap = elementCodes;	
			}
			
			var objectID = ds_map_find_value(dsMap, char2); // decode character
			var component = instance_create_layer(nodeID.x, nodeID.y, "Instances", objectID); // create instance
			component.gridX = nodeID.gridX; 
			component.gridY = nodeID.gridY; 
			nodeID.occupant = component; 
			
			if(component.faces){
				var dirStr = string_char_at(nodeInfo, 3);
				if(dirStr != "T" && dirStr != ""){
					component.facingDir = real(string_char_at(nodeInfo, 3));
				}else{
					component.facingDir = dir.south;	
				}
			}
			
		}else{

			//if there is ONLY a terrain in the node
			if(char1 == "T"){
				var objectID = ds_map_find_value(terrainCodes, char2); // decode character
				var terrain = instance_create_layer(nodeID.x, nodeID.y, "Instances", objectID);
				terrain.gridX = nodeID.gridX; 
				terrain.gridY = nodeID.gridY;
				nodeID.terrain = terrain; 
			}
			
			
		}
		
			//If there are both a componet AND a terrain in a node
			
			//if the string_length >= 4 that means a component (actor or element) was
			//created. if that component is able to face, then it will take up the first
			//3 characters of the nodeInfo string. otherwise, it will only take up the first 2. 
			//thus, when there is a terrain and component in a node the char position of the "T"
			//for terrain will change position
				if(string_length(nodeInfo) >= 4){
					
					if(component.faces && string_char_at(nodeInfo, 4) == "T"){
						var terrChar1Pos = 4;
						var terrChar2Pos = 5;	
						
					}else{
						var terrChar1Pos = 3;
						var terrChar2Pos = 4;
					}
				
			
					var terrChar1 = string_char_at(nodeInfo, terrChar1Pos);
					var terrChar2 = string_char_at(nodeInfo, terrChar2Pos);
			
					if(terrChar1 == "T"){
						var objectID = ds_map_find_value(terrainCodes, terrChar2); // decode character
						var terrain = instance_create_layer(nodeID.x, nodeID.y, "Instances", objectID);
						terrain.gridX = nodeID.gridX; 
						terrain.gridY = nodeID.gridY;
						nodeID.terrain = terrain; 
					}	
				}
		
	} 
	
	
	return object; // returns node

}