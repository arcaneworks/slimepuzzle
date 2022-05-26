//draw node sprite
draw_set_alpha(.33)
draw_rectangle_color(x,y, x + node_size - 1, y + node_size - 1, c_black, c_black, c_black, c_black, true)
draw_set_alpha(1)
if(color != c_white){
	draw_sprite_ext(spr_nodecolor, -1, x, y, 1, 1, 0, color, alpha);
}


