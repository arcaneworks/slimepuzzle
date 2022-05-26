if(obj_sub_toolbar_write.visible){
	visible = true; 
	
}else{
	visible = false;
}



if(active){
	if(mouse_over(id)){
		image_index = 1; 
		if(select_pressed()){
			obj_sub_toolbar_write.currPage += pageDir;
			
		}
			
	}else{
		image_index = 0;	
		
	}

}else{
	
	image_index = 2;	
}