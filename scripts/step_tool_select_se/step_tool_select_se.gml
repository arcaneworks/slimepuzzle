// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function step_tool_select_se(check = false){

	if(hoverTool != noone){
		if(check || select_pressed()){
			
				selectedTool = hoverTool;
				state = selectedTool.toolType; 
				selectedBox = noone;
		}
	}
}