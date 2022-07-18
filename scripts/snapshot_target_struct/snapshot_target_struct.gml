// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function snapshot_target_struct(){
	
	
	
	if(target.node){
		if(target.occupant != noone){
			target = target.occupant;	

		}else{
			if(target.terrain != noone){
				target = target.terrain; 	
			}
		}
	}
		
	if(target.component){
		target.targeted = true;
		var uList = target.undoList;
		
			//if there is already an undo struct within this guy
			if(!ds_priority_empty(uList)){
				var headUndo = ds_priority_find_max(uList);
				var tempPriority = ds_priority_find_priority(uList, headUndo);
				
				//and that struct doesn't have the same priority as the current move
				if(tempPriority != global.totalMoves){
					//then add that struct to the ds list
					var tempStruct = snap_deep_copy(target.componentStruct);
					copy_component_to_struct(target, tempStruct);
					ds_priority_add(uList, tempStruct, global.totalMoves);
				}		
			}else{
				//if there is no struct within the undo List already	
				var tempStruct = snap_deep_copy(target.componentStruct);
				copy_component_to_struct(target, tempStruct);
				ds_priority_add(uList, tempStruct, global.totalMoves);
			}
	}
}