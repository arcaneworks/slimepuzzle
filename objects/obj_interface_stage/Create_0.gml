global.cursor = id;
depth = -100;

hoverTool = noone;
selectedTool = noone;
hoverNode = noone;
hoverBox = noone;
selectedBox = noone;
timer = 15; 
cursorSprite = sprite_index;
x_offset = 0;
y_offset = 0;
cursorImg = 0;
gridX = 0; // grid position (node) the cursor is over
gridY = 0; // grid position (node) the cursor is over

state = "idle";