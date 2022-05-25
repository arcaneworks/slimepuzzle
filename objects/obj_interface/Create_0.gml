 
depth = -200; //draws above everything

global.cursor = id;

cursorSprite = sprite_index;

cursorImg = 0;
gridX = 0; // grid position (node) the cursor is over
gridY = 0; // grid position (node) the cursor is over
x_offset = 0;
y_offset = 0;
hoverNode = noone; // the node over which the cursor's hovering
disable = false;
state = "idle"; //see Step Events & Cursor Scripts 
nextState = "idle";
cursorType = "selection";
clickAble = true;
tempStruct = noone;
deselectKey = ord("X");
endKey = ord("E");

instance_create_layer(x, y, "Instances", obj_selected);
moveNodes = ds_list_create();
ds_list_add(moveNodes, ds_list_create(), ds_list_create(), ds_list_create(), ds_list_create());
dirNodes = ds_list_create(); //master list of 
eventNodes = ds_list_create();
ds_list_add(dirNodes, ds_list_create(), ds_list_create(), ds_list_create(), ds_list_create());

getTargets = false;
getMoves =false;
actableNodes = noone;
selectedActor = noone;
target = noone;
rangeDisplayed = false;
// whether there is currently a movement/attack range displayed

actorsMoved = 0;
//debug stuff
occupantText = "error";
componentsMoved = 0;
debugText = "nothing";
timer = 0;

prevKey = noone;
prevDir = noone;
prevState = "nothing";
prevNode = noone;
confirmPress = false;
tempVfx = noone;
readiedAction = noone;

execute = false;
tempNode = noone;
tempList = noone;


