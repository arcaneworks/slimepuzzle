/// @description Insert description here
// You can write your code in this editor

var quitPush = 0;
quitPush += max(keyboard_check_pressed(vk_escape), keyboard_check_pressed(ord("X")), 0);
// detects whether the user has in any way triggered the closing of the window

if(quitPush){
	instance_destroy();	
	exit;
}


// we now want to update the visible objects list according to 
// the position of the scroll bead. 
// the first step is to find the *first* object to display.
// once we find that, we can just display it and maxVisObjs-1 objects after it.
// so let's suppose that we have a group of 6 objects and can display 3 at a time.
// there are 4 display possibilities.
// [a, b, c] [b, c, d] [c, d, e] [e, f, g]
// in general, there are this many display possibilities: total objects - displayed objects + 1
// we want to divide these display possibilities evenly across the scrollbar. 
// when it's closest to scroll perc 0, it should display the first set of three
// when it's closest to scroll perc 33, it should display the second set
// closest to perc 66, display third set
// closest to perc 100, display fourth set
// how did I get that? I divided 100 by THREE, because we want FOUR total positions
// including 0 and 100. We're counting by intervals of 33. What does that 
// number-- 33-- represent, exactly? It represents the SCROLL SPACE between 
// one group and the next. Each group, we might say, is associated with
// a SCROLL POSITION, which is always a multiple of the scroll space.
//
// but how do we calculate which one the bead it's closest to?
// for example, how do we calculate which scroll position the bead
// is closest to when it's at percentage 55?
// we divide 55 by the scroll space: 55/33 = 1.7.
// then we round, and we get 2. the SCROLL POSITION is 2 * 33 = 66.
// so the first object to display is the one at index 2!-- that is, c.
// we need to display [c, d, e].
// 

var updateScrollPos = false; // whether the display is different from before

var initId = firstVisObjId; // id of first visible object before mouse/keyboard checks

var updateBead = false; // whether the position of the bead in the scrollbar needs to be updated

var disPossibilities = max((ds_list_size(objs) - maxVisObjs + 1), 1); // the number of possible groups
																 // of objs to display




if (bar.bead.moved) {
	
																 
	if (disPossibilities == 1) { // everything fits on the screen, so scrolling has no effect
		firstVisObjId = 0; // id of first obj to display
	} else {	
		var dispStep = 100/(disPossibilities - 1); // how much the scroll bead must move
												  // (in % points) to get from one display 
												  // group to the next
												  
		firstVisObjId = round(bar.bead.percentage / dispStep); // id of first obj to display
	}
	
	if (initId != firstVisObjId) {
		
		updateScrollPos = true; 
	}
	
}


	

var move = 0; 
move -= max(keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")), 0);
move += max(keyboard_check_pressed(vk_down), keyboard_check_pressed(ord("S")),0);
// detects whether the user has moved the object selector, and in which way.



if(move != 0){
	//audio_play_sound(sound0, 1, false);
	mpos += move;
	
	if(mpos < 0){
		
		mpos = 0;
		
		if (firstVisObjId > 0) {
			
			// if the user tries to go UP from the TOP of the visible list,
			// and there is at least one more object further up in the list (objs),
			// make the next object up the first item in the visible list. 
		
			firstVisObjId--;
			updateScrollPos = true; 
			updateBead = true;
		}
	}
	
	if(mpos > ds_list_size(visObjs) - 1) {
	
		mpos--;
		
		if (firstVisObjId + maxVisObjs < ds_list_size(objs)) {
			
			// if the user tries to go DOWN from the BOTTOM of the visible list,
			// and there is at least one more object further down in the (objs) list,
			// make the second object down the first item in the visible list. 
		
			firstVisObjId++;
		
			updateScrollPos = true;
			updateBead = true;
		}
	}	
}
// adjusts the selector position (mpos) according to the chosen direction. 
// scrolls up/down (and adjusts scroll bead position accordingly)
// 

if (updateScrollPos) {
	
	if (updateBead) {
		var dispStep = 100/(disPossibilities - 1); // how much the scroll bead must move
												  // (in % points) to get from one display 
												  // group to the next
		
		var beadPerc = dispStep * firstVisObjId / 100; // percentage of new scroll bead position
												 // in decimal (66% = .66)
		bar.bead.yy = ((bar.bead.bottomLimit - bar.bead.topLimit) * beadPerc); 
		bar.bead.y = bar.bead.yy + bar.bead.topLimit;
		
	}
	
	ds_list_clear(visObjs);
	var objsToDisplay = min(maxVisObjs, ds_list_size(objs));
	// # of objects to display. maximum number possible unless all objects fit on screen.
	
	for (ii = firstVisObjId; ii < firstVisObjId + objsToDisplay; ii++) {
		var obj = ds_list_find_value(objs, ii);
		ds_list_add(visObjs, obj);
	}
	// update the visible objects list according to scroll position 
	
	bar.bead.moved = false;
}


 

var hoveringBar = position_meeting(obj_interface_editor.x, obj_interface_editor.y, bar);
var hoveringObj = false;

if (!hoveringBar) {
	
	for(ii = 0; ii < ds_list_size(visObjs); ii ++){
		var menuXL = x + objHeight;
		var menuXR = x + width * .75;
		var menuYtop = y + 20 + (ii * objHeight);    
		var menuYbot = menuYtop + objHeight;
				
		if(collision_rectangle(menuXL, menuYtop, menuXR, menuYbot, obj_interface_editor, true, false)){
			mpos = ii;
			hoveringObj= true;
		
		}else{
			textColor = c_white;	
		}
	}
}
// if the user has the cursor over an object, set the selector position (mpos)
// to the position of that object.

if (hoveringBar) {
	selected = noone;
	mpos = -1;
} else if (hoveringObj) {
	selected = ds_list_find_value(visObjs, mpos);
}

// now that mpos has been updated, we set the selected object 
// according to the value of mpos. 

