//shows enemies reactions when moving into their reactList
function move_reaction_ui(){
	//if there is a hoverNode that is a moveNode
	if(hoverNode != noone && hoverNode.moveNode){
		//and that hovernode is within an enemy's react list
		with(obj_enemy){
			if(hasReaction && !ds_list_empty(reactList) && ds_list_find_index(reactList, other.hoverNode) > -1){
				with(obj_node){
					if(reactNode){
						reactNode = false;		
					}	
				}
				displayReaction = true;
				other.hoverNode.reactNode = true;	
			}else{
				displayReaction = false;
			}
		}
	}else{
		with(obj_node){
			if(reactNode){
				reactNode = false;		
			}	
		}
		with(obj_enemy){
			if(displayReaction){
				displayReaction = false;			
			}
			
		}
		
	}
}