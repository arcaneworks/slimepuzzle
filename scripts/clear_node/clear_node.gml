// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function clear_node(nodeID){
	
	with (nodeID) {
		infoText = "its just a regular node, dawg";
		depth = 1
		dark = false; 
		
		if (occupant != noone && occupant != obj_vehicle) {
			instance_destroy(occupant); // destroy occupant, if there is one
		}

		// the nodes that are adjacent to this node
		ds_list_clear(neighbors);
		ds_list_clear(actorsNear);
		
		onScreen = false;
		color = c_white;
		occupant = noone;
		effect = noone;
		passable = true;
		selected = false;
		canAct = false;
		gridX = 0;
		gridY = 0;
		cost = 1;
		G = 0;

		//draws the terrain type and effect type within switch statements
		//img is to control animation speed of each of these images

		/// TERRAIN VARIABLES
		terrain = "GROUND";
		t_img = 0;
		t_alpha = 1;

		/// EFFECT VARIABLES
		nodeAnim = "GROUND"
		a_img = 0;
		a_alpha = 0;

		img = 0; 
		//pathfinding variables ----------------------

		parent = noone;
		moveNode = false; // whether the selected character can move to this node
		targetNode = false; // whether the selected character can target this node
		actionNode = false; 
		decNode = false;
		pushNode = false; //whether actor will be pushed forward during the caravan advance

		applyDamage = false;
		ds_list_clear(targeted);
		hitable = false;
		movable = false;
		// list containing all of the actors who have targeted this node
		// used in wipenodes to keep targeted nodes yellow even when nodes
		// are wiped of path/range-finding information

		inCaravanPath = false;
		displayCaravanPath = false;

		//AURA VARIABLES 
		inAura = false;
		
		
	}
	
	
}