/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(f_battle_text_huge);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_text_color(x,y-30, "Player Name",c_white,c_white, c_white,c_white, 1);

draw_text_color(x,y+100, "Enter - Confirm",c_white,c_white, c_white,c_white, 1);
draw_text_color(x,y+160, "Esc - Back",c_white,c_white, c_white,c_white, 1);
draw_text(x + 10,y+40,message + cursor);
draw_set_valign(fa_top);
draw_default();
