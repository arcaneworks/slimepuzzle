//this is where most of the game is initialized, and where the interface and camera objects are created.

global.gameObj = id;
if(global.lastRoom == level_editor_room){
	levelString = global.editorTarget;
}else{
	levelString = "level" + string(global.currentLevel);
}
 
debugMode = false;
matt = 0;
actionState = "standby";
phase = "main";
completed = false; // used to keep track of whether 
actTimer = 20;

enum dir {
		north,
		east,
		south,
		west		
	}

//audio_play_sound(track1, 1, true)

#region MAP VARIABLES (

	globalvar map; // map of nodes

	#macro node_size 32 // size of one nozzde (height and width)

	#macro game_width 284 //size of gameplay area (ex. 320 x 320)

	#macro game_height 448
	
	#macro node_radius node_size/2
	
	#macro NOTHING -1

	#macro map_width 7
	// width of entire map at the beginning of gameplay
	
	#macro map_height 7
	
	// height of entire map at the beginning of gameplay

#endregion

loadThresh = map_height - 1;
dataThresh = map_height;
	screenHeight = 12;
	
	actorTurnCt = 2; //total amount of turns each actor gets per phase
turnList = ds_list_create(); //list of all actors in order. gets populated/sorted in initialize
turnPos = 0; //position in turn list to make currActor
currActor = noone;//actor whose turn it is
global.actionQueue = ds_priority_create(); //queue of components waiting to act. 
global.deathQueue = ds_queue_create(); //queue of components waiting to die.
standbyActor = noone;

initialize = true; 

instance_create_layer(x, y, "Instances", obj_interface); //create the cursor
global.cursor = obj_interface;


	mapOrgY = obj_map_start.y;
	mapOrgX = obj_map_start.x;
	
	init_CG_decoding_key_new(); // filled out here

	activeCGset = -1; // set of all CGs being used to update map live
	largestCG = 0; // the height of the largest CG in our active CG set. used to determine
				   // when we need to preload a new CG
	load_CG_set(levelString); 
	//set_action_db(); //creates structs containing action information (damage, targeting info, ect)

	init_populate_map(); // creates nodes based on CG set
	populate_neighbors(); //makes neighbors for nodes
	set_node_occupancy(); //sets occupancy for components 
	



turnAnimations = false;

