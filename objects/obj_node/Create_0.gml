
depth = 1
onScreen = true; // tracks whether the node is currently on screen
// the nodes that are adjacent to this node
neighbors = ds_list_create(); //initialize neighbor list 
node = true; // identifying flags
component = false;
agent = false; 
enemy = false;
color = c_white; // current color
occupant = noone; // the current occupant
effect = noone; //current effect
passable = true; // can the node be moved through
//selected = false;
//canAct = true; 
gridX = 0;
gridY = 0;
cost = 1; //movement cost 
G = 0; //current g score for pathfinding
alpha = .3;

//draws the terrain type and effect type within switch statements
//img is to control animation speed of each of these images

/// TERRAIN VARIABLES
terrain = noone;
infoText = "No effect";



img = 0; 
//pathfinding variables ----------------------

parent = noone;
moveNode = false; // whether the selected character can move to this node
targetNode = false; // whether the selected character can target this node
actionNode = false; // whether the selected character can use their action on this node
reactNode = false; // can someone do a reaction to this node
pushNode = false; //whether actor will be pushed forward during the caravan advance
passNode = false; // Whether an actor's projectile will pass through the tile
applyDamage = false; // Is damage being applied to the node?
hitable = false;	// Is the node hittable?
//movable = false;	// Is the node movable?

componentCode = noone; // codes for map loading	
terrainCode = noone;

