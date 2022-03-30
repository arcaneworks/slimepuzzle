// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function select_other(){
	if(hoverNode != noone && hoverNode.occupant != noone && hoverNode.occupant.agent && hoverNode.occupant != selectedActor && !hoverNode.actionNode){
		if(mouse_check_button_released(mb_left)){
			audio_play_sound(s_select, 1, false);
			wipe_nodes();
			ds_list_clear_inner_lists(dirNodes);
			ds_list_clear_inner_lists(moveNodes)
			selectedActor = hoverNode.occupant; 
			if(!selectedActor.canMove && selectedActor.canAct){
				state = "action target";
				getTargets = true;
	
			}else{
				state = "move";
				move_nodes(map[selectedActor.gridX, selectedActor.gridY], selectedActor.move);
			}
			
		}
		
	}
}