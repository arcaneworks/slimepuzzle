

event_inherited();
depth = -3;
infoText = " this is a component. a component is an object that occupies a node."
class = "no class";
agent = false;
component = true;
faces = false; 
facingDir = dir.south; //current facing direction. 
dirStr = 1; //how many places component is getting rotated;
bomb = false;
rotate = false; 
initialize = false; 
damagable = false;
disabled = false;
moveState = "idle";
actState = "idle";
triggersReaction = true;
victimList = ds_list_create();
targetedBy = noone;
targetable = true;
 undoList = ds_priority_create(); //list of structs to undo
 xOffset = 0;
sprXscale = 1;
sprYscale = 1;
// current position on grid
gridX = 0;
gridY = 0;
				  
actTurn = false; 
canMove = false;
canAct = false;
// whether the actor can move/act in the current declaration suphase.
// used for movement and movement dec period and action in action dec period. 


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

actor = false;
//enemy = false;
//vehicle = false; 
node = false;
move = 0;
diagonal = false;
moveSpeed = 4;

//selected = false;
hovered = false; 

type = "default";
color = c_white;
outlineCol = c_white; 
element = false; 
hitable = true;

timer = 15;
shake = false;
shakeTimer = 5;

alpha = 1;

hitSfx = s_impact_hit;

movable = true;
push = false;
shoved = false;
damaged = false;
applyDamage = false;
damage = 1;
damageType = "nothing";
damageClass = "default";
applyStatus = false; 

maxHp = 0; 
hp = 0; 
dead = false;
displayTime = 25;
hpTimer = displayTime; 

displayHp = false;

#region HealthBar draw variables

valSpr = spr_valuebar_section;
fillSpr = spr_valuebar_fill_red;
hpSec1 = spr_valuebar_section1;
hpSec2 = spr_valuebar_section2;
hpSec3 = spr_valuebar_section3;

#endregion

