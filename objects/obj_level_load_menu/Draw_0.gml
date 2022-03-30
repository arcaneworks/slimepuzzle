

//Draw menu background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

draw_set_font(f_battle_text_small_12);

var title = "LOAD MENU";
var titleX = x + .5 * width - .5 * string_width(title);
var titleY = y - string_height(title) * 1.1;

draw_text_shadow(titleX, titleY, title, c_white, c_black, 1);
//Draw the options
draw_set_font(f_battle_text_big);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
limit = pos + 8;
if(limit > op_length)
{
	limit = op_length;
}
for ( var i = pos; i < limit ; i++)
	{
		var _c = c_white;
		if(pos = i)
			_c = c_green;
		draw_text_color(x + op_border, y + op_border + op_space * (i - pos), option[i], _c, _c, _c, _c, 1);
		
	}
	
	draw_default();