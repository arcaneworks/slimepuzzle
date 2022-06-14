// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_shove(){
	if(target != noone && target.component && target.movable){// and the target is movable 	
		//audio_play_sound(action.sfx.endSfx, 0, false);
		var tempNode = push_to_node(map[gridX, gridY], map[target.gridX, target.gridY]); 
		if(tempNode != noone){
			while(tempNode && tempNode.terrain && tempNode.terrain.terrainString == "Ice"){
				tempNode = push_to_node(map[target.gridX, target.gridY],tempNode);	
			}
			target.moveToNode = tempNode; // set the target's push to node as that node
			target.moveState = "start path";
			target.shoved = true;	
		}
	}
}