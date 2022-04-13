/// @description Insert description here
// You can write your code in this editor


title = "";
selected = noone;

width = 125; 
height = 255;
// create the scroll bar
var barWidthRatio = 1/20; // how wide the scroll bar is relative to the whole window
bar = instance_create_layer(x, y, "Instances", obj_scroll_bar);

bar.depth = depth - 1;
bar.image_yscale = image_yscale;


// initialize the scroll bead
var beadGap = 1/20; // how much space separates the bead from the 
//					// bottom/top of the bar at its lowest/highest point,
//bar.bead.topLimit = y + (bar.sprite_height * beadGap); // highest point the bead can reach on bar
//bar.bead.bottomLimit = y + (bar.sprite_height * (1 - beadGap)) - bar.bead.sprite_height; // lowest point
//bar.bead.x = bar.x + (bar.sprite_width/2);
//bar.bead.y = bar.bead.topLimit; 



objs = ds_list_create(); // the list of all objects the user can view by scrolling
visObjs = ds_list_create(); // the list of all displayed objects
firstVisObjId = 0; // the index (in objs) of the first visible object
mpos = 0; // the index (in visObjs) of the selected character

objHeight = 0; // the height(in pixels) of a single object 
 
// total space (in pixels) to be used for displaying objects.

maxVisObjs = 0; 

// maxVisObjs = floor((displaySpace + tweenSpace) / (objHeight + tweenSpace));

/* maximum number of objects visible at one time. this function should be 
/ incorporated into the create event of every child of this object.
/ see below for algebraic proof of the math.
*/


// for (ii = 0; ii < maxVisObjs && ii < ds_list_size(objs); ii++) {
//	ds_list_add(visObjs, ii);
// }
// initializes the visible objects list; the first four objects
// in objs list will be displayed. 
// This function should be incorporated into 
// the create event of every child of this object.








/* Proof of numVisObjs calculation:
/  Say we've got a bunch of objects, 20 pixels tall each. 
/  5 pixels of space between each of them.
/  how many can I display in a 200 pixel space? 
/  how much space would x objects require?
/  it would require 20x + 5(x-1), since we need to display
/  x objects and x-1 spaces.
/  20x + 5(x-1) <= 200
/  25x - 5 <= 200
/  25x <= 205
/  x <= 8.2
/  so we round down to find the number of objects we can display
/  at one time: 13. 
/  so here's our formula for calculating the number of visible objects:
/* numVisObjs = floor((displaySpace + tweenSpace)/ objHeight + tweenSpace));


