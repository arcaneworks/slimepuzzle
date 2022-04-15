// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function init_CG_decoding_key_new(){
	
	//#macro EOF_string = "$";
	
	//// the node data encoded *in each position* of .csv file string.
	//// e.g. in "Sw" 'S' stands for 'shooter' (instance type) and 'w' stands
	//// for west (direction that instance is facing)
	//enum nodeData { 
	//	inst = 1, // instance type
	//	facingDir = 2,
	//	terr = 3
	//	// direction instance is facing upon creation
	//}	
	
	// 
		

	componentCodes = ds_map_create();
	
	//agents
	ds_map_add(componentCodes, "B", asset_get_index("obj_bomb"))
	ds_map_add(componentCodes, "K", asset_get_index("obj_knight"));
	ds_map_add(componentCodes, "W", asset_get_index("obj_wizard"));
	ds_map_add(componentCodes, "A", asset_get_index("obj_archer"));
	ds_map_add(componentCodes, "R", asset_get_index("obj_rogue"));
	ds_map_add(componentCodes, "C", asset_get_index("obj_cleric"));
	//enemies
	ds_map_add(componentCodes, "S", asset_get_index("obj_shooter_par"))
	ds_map_add(componentCodes, "P", asset_get_index("obj_shooter_fire"));
	ds_map_add(componentCodes, "F", asset_get_index("obj_fighter_par"));  
	
	elementCodes = ds_map_create();
	ds_map_add(elementCodes, "R", asset_get_index("obj_rock"));
	ds_map_add(elementCodes, "C", asset_get_index("obj_chest"));
	ds_map_add(elementCodes, "A", asset_get_index("obj_directorLD"));
	ds_map_add(elementCodes, "S", asset_get_index("obj_directorRD"));
	ds_map_add(elementCodes, "D", asset_get_index("obj_directorUL"));
	ds_map_add(elementCodes, "F", asset_get_index("obj_directorUR"));

	terrainCodes = ds_map_create();
	ds_map_add(terrainCodes, "L", asset_get_index("obj_flame"));
	ds_map_add(terrainCodes, "H", asset_get_index("obj_hole"));
	ds_map_add(terrainCodes, "W", asset_get_index("obj_web"));
	ds_map_add(terrainCodes, "B", asset_get_index("obj_bonfire"));
	ds_map_add(terrainCodes, "O", asset_get_index("obj_bonfire_off"));
	
	
	//directionCodes = ds_map_create();
	//ds_map_add(directionCodes, "n", dir.north);
	//ds_map_add(directionCodes, "e", dir.east);
	//ds_map_add(directionCodes, "s", dir.south);
	//ds_map_add(directionCodes, "w", dir.west);
}
