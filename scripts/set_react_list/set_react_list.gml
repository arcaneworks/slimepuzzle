// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_react_list(){
	
	with(obj_actor){
		
			if(hasReaction){
				
				switch(class){
					
					case "fighter":
						find_fighter_reaction_nodes();
					
					break;
					
					case "bomb":
						find_bomb_react_nodes();
					
					break;
					
				}
				
				
				
			}
		
		
	}
}