draw_set_color(c_black)

if(hoverNode){
	draw_rectangle(x, y, x + boxWidth, y + boxHeight, false);
	draw_set_color(c_yellow);
	draw_rectangle(x, y, x + boxWidth, y + boxHeight, true);
	
	draw_set_color(c_white);
var iconSprite = hoverNode.sprite_index; 

var scale = 1; 
var iconSize = sprite_get_width(iconSprite) * scale;
var iconBufferX = 10; 

var iconBufferY = y + .5 * boxHeight - .5 * iconSize;

if(hoverNode.terrain != noone){
	var title = hoverNode.terrain.terrainString; 	
}else{
	var title = "GROUND"; 
}
var titleX = x + iconSize + iconBufferX ;
var titleY = y + .5 * string_height(title);
draw_set_font(f_battle_text_12);

draw_text_ext(titleX, titleY, title, 10, 150); 



var info = hoverNode.infoText;

var infoY = titleY + string_height(title);

draw_set_font(f_battle_text_10);

var infoWidth = boxWidth - (iconSize + iconBufferX * 2);

draw_text_ext(titleX, infoY, info, string_height(info), infoWidth);
draw_set_font(f_battle_text);

if(hoverNode.terrain != noone){
	
draw_sprite_ext(hoverNode.terrain.sprite_index, hoverNode.terrain.image_index, x + iconBufferX, iconBufferY, scale, scale, 0, c_white, 1);
}


}
draw_set_color(c_white);
