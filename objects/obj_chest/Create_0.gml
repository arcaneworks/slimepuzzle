event_inherited();

canOpen = false; 

infoText = "Just a regular unlocked chest, right click to open!"

containerType = "chest";


chestState = "closed"; //used to cycle through animations in chest sprite 


tempState = "GROUND"; //used to record where a sprite will go after it is cleared



shine = false;
item = obj_sword;

covered = false;
opened = false;
hoverChest = false;


//chest draw variables
img = 0; // the image index of the CHEST
alpha = 1;
chestX = x;
chestY = y;
rot = 0;
color = c_white;
timer = 0;
xscale = 1;
yscale = 1;


//item variables -- WHAT IS INSIDE THE CHEST
i_spr = spr_sword;
i_img = 0;
i_alpha = 1; 
i_x = x;
i_y = chestY;
i_xscale = 1;
i_yscale = 1;
i_rot = 0;
i_color = c_white;
i_timer = 0;

ready = false;
complete = false;
