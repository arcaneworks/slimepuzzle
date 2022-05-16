// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cancel_key_check_idle(){
	
	if(keyboard_check_pressed(deselectKey) || mouse_check_button_pressed(mb_right)){
		audio_play_sound(s_cancel, 0, false);
		wipe_nodes();
		ds_list_clear_inner_lists(dirNodes);
		ds_list_clear_inner_lists(moveNodes);
		
		
		
		selectedActor = noone;
		state = "idle";
	
	}
}