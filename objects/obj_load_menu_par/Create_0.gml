depth = -10;

initialize = true;
title = "LOAD MENU";
selected = noone;
font = f_battle_text_28;
textScale = .3;
width = 125; 
height = 255;
borderY = 5;
borderX = 20;
displaySpace = height - borderY * 2;
objHeight = 0;
tweenSpace = 0;
maxVisObjs = 0;

objs = ds_list_create(); // the list of all objects the user can view by scrolling
visObjs = ds_list_create(); // the list of all displayed objects
firstVisObjId = 0; // the index (in objs) of the first visible object
mpos = 0; // the index (in visObjs) of the selected character

// total space (in pixels) to be used for displaying objects. 

textColor = c_white;

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


 //Proof of numVisObjs calculation:
 // Say we've got a bunch of objects, 20 pixels tall each. 
 // 5 pixels of space between each of them.
 // how many can I display in a 200 pixel space? 
 // how much space would x objects require?
 // it would require 20x + 5(x-1), since we need to display
 // x objects and x-1 spaces.
 // 20x + 5(x-1) <= 200
 // 25x - 5 <= 200
 // 25x <= 205
 // x <= 8.2
 // so we round down to find the number of objects we can display
 // at one time: 13. 
 // so here's our formula for calculating the number of visible objects:
 //numVisObjs = floor((displaySpace + tweenSpace)/ objHeight + tweenSpace));
 
draw_default();


