
event_inherited();

if(displayHp){
	var barWidth = valuebar_get_width(hpSec1, hpSec2, hpSec3, maxHp);
	var barHeight = sprite_get_height(hpSec1);
	
	if(class != "slime"){
		draw_valuebar_sectioned(hpSec1, hpSec2, hpSec3, fillSpr, x + .5 * sprite_width - .5 * barWidth , y  - barHeight , node_size/8, maxHp, hp, 0, c_white, .75,1);
	}else{
		draw_valuebar_sectioned(hpSec1, hpSec2, hpSec3, fillSpr, x + .5 * sprite_width - 4, y , node_size/8, maxHp, hp, 0, c_white, .75,1);
	}
}
