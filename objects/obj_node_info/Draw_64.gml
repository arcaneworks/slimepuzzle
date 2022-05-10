draw_set_color(c_black)

if(hoverNode){
	draw_rectangle(x, y, x + boxWidth - 2, y + boxHeight - 2, false);
	scr_draw_resizable(spr_frame, boxWidth, boxHeight, 0, 0, 1);

if(hoverNode.terrain != noone){
	var title = hoverNode.terrain.terrainString; 	
	var info = hoverNode.terrain.infoText;
}else{
	var title = "GROUND"; 
	var info = "Just regular ol' ground";
}
draw_set_color(c_white);
var scale = 1;
var font = f_battle_text_28;
var fontScale = .3;
var iconSize = node_size * scale;
var iconBufferX = 6;
var titleX = x + iconSize + iconBufferX ;
var titleY = y + .5 * string_height(title) * fontScale + 5;
draw_set_color(c_white);
var iconBufferY = y + .5 * boxHeight - .5 * iconSize;
var maxText = 550;
var sep = string_height(title) * 2.5;
draw_set_font(font);

draw_text_transformed(titleX, titleY, title, fontScale, fontScale, 0);  


fontScale = .20


var infoY = titleY + string_height(title) * fontScale + 3;


var infoWidth = boxWidth - (iconSize + iconBufferX * 2);


draw_text_ext_transformed(titleX, infoY, info,sep, maxText, fontScale, fontScale, 0)
if(hoverNode.terrain != noone){
	
	draw_sprite_ext(hoverNode.terrain.sprite_index, hoverNode.terrain.image_index, x + iconBufferX, iconBufferY, scale, scale, 0, c_white, 1);
}else{
	draw_sprite_ext(hoverNode.sprite_index, hoverNode.image_index, x + iconBufferX - 1, iconBufferY, scale, scale, 0, c_white, 1);	
}


}
draw_default();
