// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.gamePadSelect = gp_face1;
global.gamePadCancel = gp_face2;
global.gamePadUndo = gp_select;
global.gamePadPaused = gp_start;


function select_pressed(){
	return mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1);
}
function cancel_pressed(){
	return mouse_check_button_pressed(mb_right) || gamepad_button_check(0,gp_face2)
}
function undo_pressed(){
	return (keyboard_check(vk_control) && keyboard_check_pressed(ord("Z")))|| gamepad_button_check(0,gp_select);
}
function pause_pressed(){
	return(keyboard_check_pressed(vk_escape) || gamepad_button_check(0,gp_start));	
}
function write_hotkey_pressed(){
	return keyboard_check_pressed(ord("W")) || gamepad_button_check(0,gp_padr);
}
function move_hotkey_pressed(){
	return keyboard_check_pressed(ord("M")) || gamepad_button_check(0, gp_padu);
}

function delete_hotkey_pressed(){
	return keyboard_check_pressed(ord("D")) || gamepad_button_check(0,gp_padd);	
}
function save_hotkey_pressed(){
	return !keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_pressed(ord("S"));	
}

function saveas_hotkey_pressed(){
	return keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_pressed(ord("S"));	
}
function load_hotkey_pressed(){
	return !keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_pressed(ord("L"));	
}

