// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_onScreen_nodes(){
	for(var xx = 0; xx < map_width; xx++){
		for(var yy = advanceNumber; yy < advanceNumber + screenHeight; yy ++){
			map[xx,yy].onScreen = true;
			
		}
		
	}
}