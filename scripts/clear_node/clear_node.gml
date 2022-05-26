// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function clear_node(nodeID){
	
	with (nodeID) {
		infoText = "its just a regular node, dawg";
		depth = 1
		
		if (occupant != noone ) {
			instance_destroy(occupant); // destroy occupant, if there is one
		}

		// the nodes that are adjacent to this node
		ds_list_clear(neighbors);
		
		onScreen = false;
		color = c_white;
		occupant = noone;
		effect = noone;
		passable = true;
		//selected = false;
		canAct = false;
		gridX = 0;
		gridY = 0;
		cost = 1;
		G = 0;

		//draws the terrain type and effect type within switch statements
		//img is to control animation speed of each of these images

		/// TERRAIN VARIABLES
		terrain = "GROUND";

		/// EFFECT VARIABLES

		img = 0; 
		//pathfinding variables ----------------------

		parent = noone;
		moveNode = false; // whether the selected character can move to this node
		targetNode = false; // whether the selected character can target this node
		actionNode = false; // whether the selected character can act on this node
		pushNode = false; //whether actor will be pushed forward during the caravan advance

		applyDamage = false; // is damage being applied
		hitable = false; //can this node be hit
		//movable = false;

		
	}
	
	
}