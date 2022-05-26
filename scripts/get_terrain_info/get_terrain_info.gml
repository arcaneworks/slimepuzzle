//assigns a terrain instance variables based on the terrain database
//based on their terrain code. Usually used for level editor "bare_terrain"s
function get_terrain_info(terrain, terrainCode){
	
		var tempStruct = noone;
		
	switch(terrainCode){
		case "TF":
			tempStruct = global.terrainDB.flame; 
		break; 
		
		case "TH":
			tempStruct = global.terrainDB.hole; 
		break; 
		
		case "TW":
			tempStruct = global.terrainDB.web; 
		break; 
		
		case "TB":
			tempStruct = global.terrainDB.bonfire; 
		break; 
		
		case "TO":
			tempStruct = global.terrainDB.bonfireOff; 
		break; 

	}
	
	if(tempStruct != noone){
		set_terrain_info(tempStruct, terrain);
	}
}
