/// @description Insert description here
// You can write your code in this editor
if (mouse_y < bead.bottomLimit) && (mouse_y > bead.topLimit) {
	bead.y = mouse_y;
	bead.yy = mouse_y - bead.topLimit; 
	bead.moved = true; 
}