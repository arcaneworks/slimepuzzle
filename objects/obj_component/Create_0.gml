

event_inherited();
depth = -3;
infoText = " this is a component. a component is an object that occupies a node."
class = "no class";
agent = false;
component = true;
obstacle = false; 
changeDir = true;
defending = false;
faces = false; 
facingDir = dir.south; //current facing direction. 
dirStr = 1; //how many places component is getting rotated;
bomb = false;
reaction = false;
react = false;
rotatable = true;
rotate = false; 
initialize = false; 
damagable = false;
isTerrain = false;
incapacitated = false;
moveState = "idle";
actState = "idle";
gameState = "player turn";
triggersReaction = true;
 
targetedBy = noone;
 
 xOffset = 0;
sprXscale = 1;
sprYscale = 1;
// current position on grid
gridX = 0;
gridY = 0;
				  
execChoice = false; /* "execution choice" - whether this character 
					/ has an additional choice to make during the execution 
					/ phase. E.g. a knight declares an intention to attack 
					/ an adjacent square during his declaration phase, but 
					/ gets to decide which adjacent square to attack during 
					/ the execution phase. In this case, 
					/ execChoice would be set to ‘true’ as soon as he committed 
					/ to that action.
				   */ 
				   
actTurn = false; 
myTurn = false;
canMove = false;
canAct = false;
// whether the actor can move/act in the current declaration suphase.
// used for movement and movement dec period and action in action dec period. 

actionSpent = false; 
// whether the actor has already acted/moved during the current period

currNode = noone; 
// the node this actor is currently occupying

prevNode = noone; 
// the node this actor was occupying before movement.
// this is used in obj_interface step event (specifically step_actor_move_dec)
// to allow the user to retracvt a movement they had made with an actor (before committing)


deathWait = false;
moveToNode = noone; 
collision = false;

//pathfinding variables-----------------------------------
movementPath = path_add();  
path_set_kind(movementPath, 2);
path_set_closed(movementPath, false);

endPath = "idle";
actor = false;
enemy = false;
vehicle = false; 
node = false;
move = 0;
diagonal = false;
moveSpeed = 4;

selected = false;
hovered = false; 

type = "default";
color = c_white;
outlineCol = c_white; 
element = false; 
hitable = true;

timer = 15;
shake = false;
shakeTimer = 5;
invisible = false;
alpha = 1;

hitSfx = s_impact_hit;

movable = true;
push = false;
shoved = false;
damaged = false;

inc = 0; 
inc2 = 0; 
inc3 = 0; 
inc4 = 0; 
inc5 = 0; 


applyDamage = false;
damage = 1;
damageType = "nothing";
damageClass = "default";
applyStatus = false; 
canStatus = false; 

maxHp = 0; 
hp = 0; 
displayTime = 25;
hpTimer = displayTime; 

displayHp = false;

#region HealthBar draw variables

valSpr = spr_valuebar_section;
fillSpr = spr_valuebar_fill_red;

var valString = sprite_get_name(valSpr);

hpSec1 = asset_get_index(valString) + "1";
hpSec2 = asset_get_index(valString) + "2";
hpSec3 = asset_get_index(valString) + "3";

hpBarX = x - .5 * sprite_width;
hpBarY = y - .5 * sprite_height;

#endregion

