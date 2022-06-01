// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.gamePadSelect = gp_face1;
global.gamePadCancel = gp_face2;
global.gamePadUndo = gp_select;
global.gamePadPaused = gp_start;
global.gamePad = false;

function movement_pressed(){
	return up_pressed() || right_pressed() || down_pressed()|| left_pressed();	
}
function up_pressed(){
	return keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up) || gamepad_button_check(0, gp_padu);
}

function right_pressed(){
	return keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_button_check(0, gp_padr);
}

function down_pressed(){
	return keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down) || gamepad_button_check(0, gp_padd);
}


function left_pressed(){
	return keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_button_check(0, gp_padl);
}

function select_pressed(){
	return mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1);
}
function cancel_pressed(){
	return mouse_check_button_pressed(mb_right) || gamepad_button_check(0,gp_face2)
}
function undo_pressed(){
	return (keyboard_check(vk_control) && keyboard_check_pressed(ord("Z")))|| gamepad_button_check_pressed(0,gp_select);
}
function next_level_pressed(){
	return (keyboard_check(vk_space) || gamepad_button_check_pressed(0, gp_face1));	
}
function pause_pressed(){
	return(keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0,global.gamePadPaused));	
}
function write_hotkey_pressed(){
	return keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0,gp_padr);
}
function move_hotkey_pressed(){
	return keyboard_check_pressed(ord("M")) || gamepad_button_check_pressed(0, gp_padu);
}

function delete_hotkey_pressed(){
	return keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0,gp_padd);	
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
function switch_tab_hotkey_pressed(){
	return keyboard_check_pressed(vk_tab) || gamepad_button_check_pressed(0,gp_face4);	
}
function shoulder_pressed(){
	return left_shoulder_pressed() || right_shoulder_pressed();	
}
function right_shoulder_pressed(){
	return keyboard_check_pressed(ord("E")) || gamepad_button_check_pressed(0,gp_shoulderr);
}
function left_shoulder_pressed(){
	return keyboard_check_pressed(ord("Q")) || gamepad_button_check_pressed(0, gp_shoulderl);	
}
