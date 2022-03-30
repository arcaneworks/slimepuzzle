///@funct end_key_check
///@descrip FOR USE IN CURSOR SWITCH STATEMENTS - 
function end_key_check() {


	if(keyboard_check_pressed(endKey)){
		state= "idle";
		selectedActor.ap = 0;
		selectedActor.canAct = false;
		ds_list_add(global.gameObj.waitList, selectedActor);
		selectedActor = noone;
		wipe_nodes();
	}


}
