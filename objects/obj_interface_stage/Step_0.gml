x = mouse_x;
y = mouse_y;

image_index = 1;
if(instance_position(x, y, obj_level_box)){
	hoverBox = 	instance_position(x, y, obj_level_box);
	
	
}else{
	hoverBox = noone;	
}
if(hoverBox != noone){
	if(select_pressed()){
		if(hoverBox == selectedBox){

			selectedBox = noone;
		}else{
			selectedBox = hoverBox;	
		}
	}
	
	if(cancel_pressed()){
		hoverBox.level = "empty";
		selectedBox = noone;
		
	}
}

update_cursor_pos();
step_tool_select_se();


switch(state){
	case "write":
	
	
	break;
	
	case "switch":

	
	
	break; 
	
	case "erase":
		
	
	
	break;
	
}