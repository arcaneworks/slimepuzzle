
depth = -200; //draws above everything

global.cursor = id;
cursorSprite = sprite_index;
x_offset = 0;
y_offset = 0;
cursorImg = 0;
gridX = 0; // grid position (node) the cursor is over
gridY = 0; // grid position (node) the cursor is over

hoverNode = noone; // the node over which the cursor's hovering
disable = false;
state = "move"; //see Step Events & Cursor Scripts 
nextState = "idle";
cursorType = "selection";
clickAble = true;

deselectKey = ord("X");
endKey = ord("E");
getTargets = false;

initialize = true;
actableNodes = noone;
selectedActor = noone;
target = noone;
rangeDisplayed = false;
// whether there is currently a movement/attack range displayed

actorsMoved = 0;
//debug stuff
occupantText = "error";
componentsMoved = 0;
timer = 0;

prevKey = noone;
prevDir = noone;
prevState = "nothing";
prevNode = noone;

confirmPress = false;
confirmDec = noone;
tempVfx = noone;
readiedAction = noone;

hoverTool = noone;
selectedTool = noone;

execute = false;
tempNode = noone;
tempList = noone;
selectedObj = noone;

hoverObjTool = noone;
selectedObjTool = noone;
selectedComponent = noone;

instance_create_layer(x, y, "Instances", obj_selected);
