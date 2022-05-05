///@arg aspect
function set_aspect(aspect) {
	with(obj_camera)
	{
		switch(aspect)
		{
			case Aspects._16x9: 
				current_height = base_height;
				current_width = base_height*(16/9);
				break;
			case Aspects._21x9: 
				current_height = base_height;
				current_width = base_height*(21/9);
				break;
			case Aspects._4x3: 
				current_height = base_height;
				current_width = base_height*(4/3);
				break;
			case Aspects._1x1: 
				current_height = base_height;
				current_width = base_height;
				break;
			case Aspects._9x16: 
				current_width = base_height;
				current_height = base_width;
				break;
		}
	
		instance_create_depth(0,0,-1000,obj_screen_fade);
		window_set_size(current_width, current_height)
		//resize_window;
		event_user(0); //snap camera
	}


}
