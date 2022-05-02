/// @description Insert description here
// You can write your code in this editor
draw_set_font(f_battle_text_huge);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
var _c = c_white;
volume = audio_get_master_gain(0) * 10;

volume_text = "Volume: " + string(volume);
draw_text_color(x, y, volume_text, _c, _c, _c, _c, 1);
