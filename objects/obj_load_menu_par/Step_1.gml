if(initialize){
	#region
	 //create the scroll bar
		bar = instance_create_layer(x + width, y, "Instances", obj_scroll_bar);
		bar.menuPar = id;
		bar.depth = depth - 1;
		bar.image_yscale = image_yscale;
		
		displaySpace = height - borderY * 2;

		var tempString = "test";
		draw_set_font(font);
		objHeight = string_height(tempString) * textScale;
		tweenSpace = 2;
		maxVisObjs = floor((displaySpace + tweenSpace) / objHeight);
		draw_default();
		
		for (ii = 0; ii < maxVisObjs && ii < ds_list_size(objs); ii++) {
			var obj = ds_list_find_value(objs, ii);
			ds_list_add(visObjs, obj);
		}
		
	#endregion
	
	initialize = false;	
}
