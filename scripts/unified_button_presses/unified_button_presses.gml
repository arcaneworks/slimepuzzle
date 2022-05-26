// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function select_pressed(){
	return mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1);
}
function cancel_pressed(){
	return mouse_check_button_pressed(mb_right) || gamepad_button_check(0,gp_face2)
}
