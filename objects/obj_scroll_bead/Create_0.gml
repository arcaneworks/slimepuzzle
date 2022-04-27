/// @description Insert description here
// You can write your code in this editor
depth = obj_scroll_bar.depth - 1;
yy = 0; // position of bead relative to bar.
		// 0 at top of bar; 100 at bottom.
 x = obj_scroll_bar.x + sprite_width/2; // origin of bead sprite is middle top
 y = obj_scroll_bar.y + sprite_height/10; // assumed that bead is ~1/10 as tall as the bar		
active = false;
moved = false;
percentage = 0;

topLimit = 0; // highest point the bar can reach
bottomLimit = 0; // lowest point the bar can reach
