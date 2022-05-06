draw_set_color(c_black)

if(hoverNode){
	draw_rectangle(x, y, x + boxWidth - 2, y + boxHeight - 2, false);
	scr_draw_resizable(spr_frame, boxWidth, boxHeight, 0, 0, 1);
	draw_set_color(c_white);
	var iconSprite = hoverNode.sprite_index; 
if(hoverNode.occupant != noone){
	var title = string_upper(hoverNode.occupant.class); 	
	var info = hoverNode.occupant.infoText;
}else{
	var hovX = hoverNode.gridX;
	var hovY = hoverNode.gridY;
	var title = string(hovX) + ", " + string(hovY); 
	var info = "no InfoText";
}

var scale = 1;
var font = f_battle_text_28;
var fontScale = .3;
var iconSize = sprite_get_width(iconSprite) * scale;
var iconBufferX = 2;
var titleX = x + iconSize + iconBufferX ;
var titleY = y + .5 * string_height(title) * fontScale + 5;
draw_set_color(c_white);
var iconBufferY = y + .5 * boxHeight - .5 * iconSize;
var maxText = 600;
var sep = string_height(title) * 2.5;
draw_set_font(font);

draw_text_transformed(titleX, titleY, title, fontScale, fontScale, 0);  


fontScale = .20


var infoY = titleY + string_height(title) * fontScale + 3;


var infoWidth = boxWidth - (iconSize + iconBufferX * 2);


draw_text_ext_transformed(titleX, infoY, info,sep, maxText, fontScale, fontScale, 0)
if(hoverNode.occupant != noone){
	
draw_sprite_ext(hoverNode.occupant.sprite_index, hoverNode.occupant.image_index, x + iconBufferX, iconBufferY, scale, scale, 0, c_white, 1);
}


}
draw_set_color(c_white);
