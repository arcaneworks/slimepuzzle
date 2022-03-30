global.font_main = font_add_sprite(f_gameover_big, 32, true,1);
global.playerProfile = "default";
global.currentLevel = 1;
global.undoneMoves = 0;
global.resets = 0;
global.editorTarget = "blank level";
global.testTarget = "blank level";
global.cursor = noone;
global.gameObj = noone;
componentCodes = ds_map_create(); // decoding key for CG data files
set_action_db();
set_component_info_db();