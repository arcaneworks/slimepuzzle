global.font_main = font_add_sprite(f_gameover_big, 32, true,1);
global.playerProfile = "default";
global.currentLevel = 1;
global.currentStage = 0;
global.undoneMoves = 0;
global.resets = 0;
global.saves = 0;
global.editorTarget = "blank level";
global.testTarget = "temp level";
global.tempTarget = "temp level";
global.cursor = obj_interface_menu;
global.gameObj = noone;
global.cursorSensitivity = 5;
global.lastRoom = room;
componentCodes = ds_map_create(); // decoding key for CG data files
global.stages = load_stage_set("stages");
set_action_db();

set_component_info_db();

if(!directory_exists("CGs")){
	directory_create("CGs");
}