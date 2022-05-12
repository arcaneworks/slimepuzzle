// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function test_button(){
	if(instance_exists(obj_bare_component)){
	
				save_CG_set(global.testTarget);
				global.cursor = noone;
				
				global.lastRoom = room;
				room_goto(test_room);

	}

}