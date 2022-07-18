
event_inherited();

if(displayHp){
	var barWidth = valuebar_get_width(hpSec1, hpSec2, hpSec3, maxHp);
	var barHeight = sprite_get_height(hpSec1);
	
	
	if(maxHp > 1){
		//if this actor has more than one hp
		draw_valuebar_sectioned(spr_valuebar_section1, spr_valuebar_section2, spr_valuebar_section3, spr_valuebar_fill_red, (x + .5 * sprite_width - .5 *  barWidth) + xOffset , y  - barHeight , node_size/8, maxHp, hp, 0, c_white, valuebarAlpha,1);
	}else{
		barWidth = sprite_get_width(spr_valuebar_1hp);
		draw_valuebar_sectioned(spr_valuebar_section1, spr_valuebar_section2, spr_valuebar_section3, spr_valuebar_fill_red, x + .5 * sprite_width - .5 * barWidth + xOffset, y , node_size/8, maxHp, hp, 0, c_white, valuebarAlpha,1);
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
	draw_text_transformed(x + xOffset + sprite_width - textWidth, y, text, textScale, textScale, 0);
	
	
	if(global.cursor.hoverNode != noone && global.cursor.hoverNode.reactNode){
		draw_set_alpha(.5);
		draw_line_width_color(x + node_size/2, y +  node_size/2, global.cursor.hoverNode.x + node_size/2, global.cursor.hoverNode.y + node_size/2,4, c_red, c_red);
		
	}
	
	draw_default();
}
