//this is where most of the game is initialized, and where the interface and camera objects are created.

global.gameObj = id;
//get the index/name for the current stage the player is in
var stagenum = global.currentStage;
var stageString = global.stages[stagenum];

//make stage art assets visible
if(layer_exists(stageString + "Trees"))
	layer_set_visible(stageString + "Trees", true);
if(layer_exists(stageString + "Grass"))
	layer_set_visible(stageString + "Grass", true);
if(layer_exists(stageString + "GrassDrk"))
	layer_set_visible(stageString + "GrassDrk", true);
if(layer_exists(stageString + "Dirt"))
	layer_set_visible(stageString + "Dirt", true);

// get name for target room/current level
if(global.lastRoom == level_editor_room){
	level = global.testTarget;
	levelString = global.tempTarget;
}else{
	 levelString = stageString + string(global.currentLevel);
	 level = levelString;
}

// initialize game instance variables
debugMode = false; //toggles debug info display
actionState = "standby"; // string used as a switch for tracking current game state
completed = false; // used to keep track of whether 
levelComplete = false; //flag for tracking when the level is completed
enum dir { //enum used for tracking component direction
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
	
	//#macro NOTHING -1

	#macro map_width 7
	// width of entire map at the beginning of gameplay
	
	#macro map_height 7
	
	// height of entire map at the beginning of gameplay

#endregion

	loadThresh = map_height - 1; //threshold for for checks involving map height
	dataThresh = map_height; //threshold for setting the data array size
	screenHeight = 12; // used to set on screen node size
	
	actorTurnCt = 2; // total amount of turns each actor gets per phase
turnList = ds_list_create(); //list of all actors in order. gets populated/sorted in initialize
turnPos = 0; //position in turn list to make currActor
currActor = noone;//actor whose turn it is
global.actionQueue = ds_priority_create(); //queue of components waiting to act. 
global.deathQueue = ds_queue_create(); //queue of components waiting to die.
global.totalMoves = 0; //current number of queued moves.
standbyActor = noone; // character who is currently acting

initialize = true; // flag marking that the game is currently initializing

instance_create_layer(x, y, "Instances", obj_interface); //create the cursor
	global.cursor = obj_interface; //set the cursor global to the game interface


	mapOrgY = obj_map_start.y; //set map origin variables
	mapOrgX = obj_map_start.x;
	
	init_CG_decoding_key_new(); // filled out here

	activeCGset = -1; // set of all CGs being used to update map live
	largestCG = 0; // the height of the largest CG in our active CG set. used to determine
				   // when we need to preload a new CG
	
	if(file_exists("CGS\\" + levelString + ".csv")){
		load_CG_set(level); 
		//set_action_db(); //creates structs containing action information (damage, targeting info, ect)

		init_populate_map(); // creates nodes based on CG set
		populate_neighbors(); //makes neighbors for nodes
		set_node_occupancy(); //sets occupancy for components 
		}else{
		levelComplete = true;	
	}
instance_create_layer(x + 25, y + 25, "Instances", obj_level_info);