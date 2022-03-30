// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_player_data(){
	//var _saveData = array_create(0);
	if(!directory_exists("saves")){
		directory_create("saves");
}
		var _saveEntity = 
		{
			playerName : global.playerProfile,
			currentLevel : global.currentLevel,
			resets : global.resets,
			undoneMoves : global.undoneMoves,
		}
		//turn the data into a JSON string and save it via buffer
		var _string = json_stringify(_saveEntity);
		var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
		buffer_write(_buffer, buffer_string, _string);
		buffer_save(_buffer, "saves\\"+ _saveEntity.playerName + ".sav");
		buffer_delete(_buffer);
		show_debug_message("Game Saved! " + _string);
}