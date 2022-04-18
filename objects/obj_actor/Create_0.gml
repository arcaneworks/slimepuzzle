event_inherited(); //inherits most stuff from obj_component

#region Actor specific instance Variables 
	enemy = false;
	actor = true; 
	bomb = false;
	advancing = false;
	initialize = true;
	targetList = ds_list_create();
	reactList = ds_list_create(); //if another actor steps in these nodes, react
	hitable = true; 
	rotatable = true;
	damagable = true;
	setDir = true;
	targeted = false;
	poob = false;
	weakness = false;
	hasReaction = false;
	actState = "idle";
	moveState = "idle";
	defending = false;
	SPD = 1;
	miss = false; 
	defendKey = "Z";
	defendTimer = 0;
	defendTime = 30; 
	defendBuffer = 0;
	
	depth = -3;
	name = "NAME"
	class = "CLASS"
	move = 2;
	
	canAct = true;
	canMove = true;
	
	portraitSpr = spr_portrait_noone;
	invisible = false;
	
	finPush = false;
	selected = false;
	hovered = false;

	maxHp = 4; 
	hp = maxHp;
	defaultTimer = 20;
	timer = 20;

	actorDest = y;
	nextNode = noone;
	prevNode = noone;
	applyDamage = false;
	
	status = noone; // string of status e.g. "burning";
	statusIns = noone; // instance holding status properties / visuals
	statusCt = 0; // number of turns this status effects the actor. counts down at end of enemy turn
	applyStatus = false; // boolean -- applies effect of status to actor. like applyDamage
	
	
	actionNodes = ds_list_create();
	
#endregion 

#region HealthBar draw variables

valSpr = spr_valuebar_section;
fillSpr = spr_valuebar_fill_red;

var valString = sprite_get_name(valSpr)

hpSec1 = asset_get_index(valString) + "1";
hpSec2 = asset_get_index(valString) + "2";
hpSec3 = asset_get_index(valString) + "3";

hpBarX = x - .5 * sprite_width;
hpBarY = y - .5 * sprite_height;

vfx = noone;

#endregion


					

