/// @description Insert description here
// You can write your code in this editor
if(string_length(keyboard_string) < limit && !instance_exists(obj_confirm))
	message = keyboard_string;
else
	keyboard_string = message;
	
	
if(confirmDec){
	global.playerProfile = message;
	TransitionStart(game_room,sqFadeOutMenu,sqFadeIn);
}
