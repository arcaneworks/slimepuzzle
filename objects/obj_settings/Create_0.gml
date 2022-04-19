global.font_main = font_add_sprite(f_gameover_big, 32, true,1);
global.playerProfile = "default";
global.currentLevel = 1;
global.undoneMoves = 0;
global.resets = 0;
global.editorTarget = "blank level";
global.testTarget = "blank level";
global.tempTarget = "temp level";
global.cursor = obj_interface_menu;
global.gameObj = noone;
global.cursorSensitivity = 5;
componentCodes = ds_map_create(); // decoding key for CG data files
set_action_db();
set_component_info_db();

if(!directory_exists("CGs")){
	directory_create("CGs");
}