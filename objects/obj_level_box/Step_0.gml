if(selected || hovered){
	
		image_index = 1;	

}else{
	if(level != "empty"){
		hasLevel = true;
		image_index = 2;
	}else{
		hasLevel = false;
		image_index = 0;	
	}
}

if(hasLevel){
	image_index = 2;
}

if(mouse_over()){
	hovered = true; 	
	
	if(select_pressed()){
		if(selected){
			obj_stage_editor.selectedBox = noone;
			selected = false;	
			
		}else{
			with(obj_level_box){
				if(selected){
					selected = false;		
				}
			}
			obj_stage_editor.selectedBox = id;
			selected = true;
		}
	}
}else{
	hovered = false; 	

}
