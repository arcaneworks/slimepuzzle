event_inherited();



//draw_text(x + 40, y, actState);
if(defending){
	draw_set_alpha(.75);
	draw_sprite(spr_defend, -1,x, y);
	draw_set_alpha(1);
	
}

draw_set_color(c_white);



