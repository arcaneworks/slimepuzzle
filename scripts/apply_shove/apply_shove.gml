// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_shove(){
	if(target.component && target.movable){// and the target is movable 	
		audio_play_sound(action.sfx.endSfx, 0, false);
		var tempNode = push_to_node(map[gridX, gridY], map[target.gridX, target.gridY]); 
		if(tempNode != noone){
			target.moveToNode = tempNode; // set the target's push to node as that node
			target.moveState = "start path";
			target.shoved = true;	
		}
	}
}