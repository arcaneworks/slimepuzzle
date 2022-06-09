menuPar = noone;
scroll_amount = 10;
beadX = x + sprite_width/2; // origin of bead sprite is middle top
beadY = y + sprite_height/10; // assumed that bead is ~1/10 as tall as the bar
bar_height = sprite_height;

bead = instance_create_layer(beadX, beadY, layer, obj_scroll_bead);


var beadGap = 1/20; // how much space separates the bead from the 
						// bottom/top of the bar at its lowest/highest point,
bead.topLimit = y + (sprite_height * beadGap); // highest point the bead can reach on bar
bead.bottomLimit = y + (sprite_height * (1 - beadGap)) - bead.sprite_height; // lowest point
bead.x = x + (sprite_width/2);
bead.y = bead.topLimit; 
