// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_player_data(fileName){
		fileName = "saves\\" + fileName;
	if(file_exists(fileName)){
		var _buffer = buffer_load(fileName);
		var _string = buffer_read(_buffer, buffer_string);
		buffer_delete( _buffer);
		var _loadData = json_parse(_string);
		
		global.playerProfile = _loadData.playerName;
		global.currentLevel = _loadData.currentLevel;
		global.resets = _loadData.resets;
		global.undoneMoves = _loadData.undoneMoves;
	}
}