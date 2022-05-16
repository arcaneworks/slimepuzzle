
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

if(displayReaction){
	outlineCol = c_red;	
	draw_set_font(f_battle_text_28);
	var text = "!";
	var textScale = .5;
	var textHeight = string_height(text) * textScale; 
	var textWidth = string_width(text) * textScale;
	draw_set_color(c_red);
	draw_text_transformed(x + sprite_width - textWidth, y, text, textScale, textScale, 0);
	
	
	if(global.cursor.hoverNode != noone && global.cursor.hoverNode.reactNode){
		draw_set_alpha(.5);
		draw_line_width_color(x + node_size/2, y +  node_size/2, global.cursor.hoverNode.x + node_size/2, global.cursor.hoverNode.y + node_size/2,4, c_red, c_red);
		
	}
	
	draw_default();
}
