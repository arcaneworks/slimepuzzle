// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function populate_agent_list(){
	
	with(obj_agent){
		if(map[gridX, gridY].onScreen){
			if(hasTurn){
				ds_list_add(other.agentList, id);
			}
		}
	}
}