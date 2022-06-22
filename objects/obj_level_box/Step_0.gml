if(obj_interface_stage.selectedBox == id || hovered){
	
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

}else{
	hovered = false; 	

}
