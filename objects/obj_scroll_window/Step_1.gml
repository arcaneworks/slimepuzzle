if(initialize){
	#region
	 //create the scroll bar
		bar = instance_create_layer(x + width, y, "Instances", obj_scroll_bar);
		bar.menuPar = id;
		bar.depth = depth - 1;
		bar.image_yscale = image_yscale;
	
	#endregion
	
	
	
	initialize = false;	
}
