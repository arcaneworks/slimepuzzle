/// @description Insert description here
// You can write your code in this editor
depth = obj_scroll_bar.depth - 1;
if (!mouse_check_button(mb_left)) {
	active = false;
}

if (active = false) {
	exit;
} else {
	if ((mouse_y) < bottomLimit) && ((mouse_y) > topLimit) {
		// if there's space to drag, drag!
		y = mouse_y;
		
	} else if (mouse_y > bottomLimit) {
		
		y = bottomLimit;
		
		
	} else if (mouse_y < topLimit) {
		
		y = topLimit;
		
	}
	moved = true;
}

yy = y - topLimit; 
percentage = round((yy/(bottomLimit - topLimit)) * 100);