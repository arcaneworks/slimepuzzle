
if(alpha < 1){
	alpha += .02;
}

draw_set_color(c_black);
draw_set_alpha(alpha);

draw_rectangle(0, 0, room_width, room_height, false)

draw_set_alpha(1);



draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(f_gameover_big);
draw_set_color(c_white);

draw_text(cx, cy, text);


draw_set_font(f_gameover_small)

draw_text_ext(cx, cy + 60, subtext, 20, 250);

draw_default();

