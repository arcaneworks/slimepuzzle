

instance_create_layer(x, y, "Instances", obj_interface_editor); //create the cursor
global.cursor = obj_interface_editor;
instance_create_layer(x + 550, y + 2, "Instances", obj_test_button); //create the cursor
instance_create_layer(x + 550 - 144, y + 2, "Instances", obj_clear_button);
#region MAP VARIABLES (

globalvar map; // map of nodes
loadThresh = map_height - 1;
dataThresh = map_height;
screenHeight = 12;

#endregion 
	
debugMode = false;

mapOrgY = obj_map_start.y;
mapOrgX = obj_map_start.x;
componentCodes = ds_map_create(); // decoding key for CG data files
init_CG_decoding_key_new(); // filled out here

activeCGset = -1; // set of all CGs being used to update map live
largestCG = 0; // the height of the largest CG in our active CG set. used to determine
				// when we need to preload a new CG
level = global.editorTarget;
load_CG_set(level); 
init_populate_map_editor(); // creates nodes based on CG set
populate_neighbors(); //makes neighbors for nodes
set_node_occupancy_editor(); //sets occupancy for components 
turnAnimations = false;

instance_create_layer(x, y, "Instances", obj_node_info_le);
instance_create_layer(x, y, "Instances", obj_component_info_le);