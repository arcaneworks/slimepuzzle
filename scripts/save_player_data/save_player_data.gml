// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_player_data(){
	// make sure the save directory exists and make one if not
	if(!directory_exists("saves")){
		directory_create("saves");
	}
	// shove all our globals into the savedata
	var _saveEntity = 
	{
		playerName : global.playerProfile,
		currentLevel : global.currentLevel,
		currentStage : global.currentStage,
		resets : global.resets,
		undoneMoves : global.undoneMoves,
		saveDate : date_current_datetime(),
	}
	//turn the data into a JSON string and save it via buffer
	var _string = json_stringify(_saveEntity);
	// make the buffer
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	// write to the buffer
	buffer_write(_buffer, buffer_string, _string);
	// save the buffer
	buffer_save(_buffer, "saves\\"+ _saveEntity.playerName + ".sav");
	// kill the buffer
	buffer_delete(_buffer);
	// write saveData to the console for fun
	show_debug_message("Game Saved! " + _string);
}