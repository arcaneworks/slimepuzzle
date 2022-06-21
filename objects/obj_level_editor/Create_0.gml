

instance_create_layer(x, y, "Instances", global.cursor); //create the cursor
global.cursor = global.cursor;
global.gameObj = id;
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
if(global.editorTarget = "test level"){
	levelString = global.tempTarget;
}else
levelString = global.editorTarget;
load_CG_set(level); 
init_populate_map_editor(); // creates nodes based on CG set
populate_neighbors(); //makes neighbors for nodes
set_node_occupancy_editor(); //sets occupancy for components 
turnAnimations = false;
