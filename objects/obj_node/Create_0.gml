
depth = 1
dark = false; 
onScreen = true; 
// the nodes that are adjacent to this node
neighbors = ds_list_create();
actorsNear = ds_list_create();
node = true;
component = false;
agent = false; 
enemy = false;
color = c_white;
occupant = noone;
effect = noone;
passable = true;
selected = false;
canAct = true;
gridX = 0;
gridY = 0;
cost = 1;
G = 0;
alpha = .3;

//draws the terrain type and effect type within switch statements
//img is to control animation speed of each of these images

/// TERRAIN VARIABLES
terrain = noone;
t_img = 0;
t_alpha = 1;
infoText = "No effect";


/// EFFECT VARIABLES
nodeAnim = "GROUND";
a_img = 0;
a_alpha = 0;

img = 0; 
//pathfinding variables ----------------------

parent = noone;
moveNode = false; // whether the selected character can move to this node
targetNode = false; // whether the selected character can target this node
actionNode = false; 
executeNode = false;
reactNode = false;
potNode = false; 
decNode = false;
pushNode = false; //whether actor will be pushed forward during the caravan advance
passNode = false;
vehicle = false;
applyDamage = false;
targeted = ds_list_create();
hitable = false;
movable = false;
// list containing all of the actors who have targeted this node
// used in wipenodes to keep targeted nodes yellow even when nodes
// are wiped of path/range-finding information

inCaravanPath = false;
displayCaravanPath = false;

//AURA VARIABLES 
inAura = false;

componentCode = noone; 
terrainCode = noone;

