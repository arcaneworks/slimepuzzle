//this is where most of the game is initialized, and where the interface and camera objects are created.

global.gameObj = id;

levelString = global.tempTarget;
level = global.testTarget;
debugMode = false;
matt = 0;
actionState = "standby";
phase = "main";
completed = false; // used to keep track of whether 
actTimer = 20;


//audio_play_sound(track1, 1, true)

#region MAP VARIABLES (

	globalvar map; // map of nodes

	
	// height of entire map at the beginning of gameplay

	
loadThresh = map_height - 1;
dataThresh = map_height;
	screenHeight = 12;
	
	
	actorTurnCt = 2; //total amount of turns each actor gets per phase
turnList = ds_list_create(); //list of all actors in order. gets populated/sorted in initialize
turnPos = 0; //position in turn list to make currActor
currActor = noone;//actor whose turn it is
actionQueue = ds_queue_create(); //queue of components waiting to act. 
standbyActor = noone;

initialize = true; 

	instance_create_layer(x, y, "Instances", obj_interface); //create the cursor
	global.cursor = obj_interface;


	mapOrgY = obj_map_start.y;
	mapOrgX = obj_map_start.x;
	
	init_CG_decoding_key_new(); // filled out here

	activeCGset = -1; // set of all CGs being used to update map live
	largestCG = 0; // the height of the largest CG in our active CG set. used to determine
	
	var ii = 1;// when we need to preload a new CG
	load_CG_set(global.testTarget); 
	//set_action_db(); //creates structs containing action information (damage, targeting info, ect)

	init_populate_map(); // creates nodes based on CG set
	populate_neighbors(); //makes neighbors for nodes
	set_node_occupancy(); //sets occupancy for components 
		

var xBuffer = 6;
var spriteWidth = sprite_get_width(spr_undo);


instance_create_layer(x + mapOrgX, y + mapOrgY + game_height, "Instances", obj_portrait);


turnAnimations = false;

#endregion


