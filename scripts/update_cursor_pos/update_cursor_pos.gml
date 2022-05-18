function update_cursor_pos() {
	axish = gamepad_axis_value(0, gp_axislh);
	axisv = gamepad_axis_value(0, gp_axislv);
	if(axish * axish > 0.05){
	x_offset += axish * global.cursorSensitivity;
	}
	if(axisv * axisv > 0.05){
	y_offset += axisv * global.cursorSensitivity;
	}
	x = mouse_x + x_offset;
	y = mouse_y + y_offset;


	if(mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_face1)){
		if(sprite_index == spr_cursor){
			cursorImg = 1;
			timer = 8;
		}
	
	}else{
		if(timer > 0){
			timer--;
		}else{
			cursorImg = 0;
		}
	}

	if(instance_position(x, y, obj_node)){
		hoverNode = instance_position(x, y, obj_node);
		gridX = hoverNode.gridX;
		gridY = hoverNode.gridY;
	
	}else{
		hoverNode = noone;
		gridX = 0;
		gridY = 0;
	}
	
	if(instance_position(x, y, obj_tool)){
		hoverTool = instance_position(x, y, obj_tool)

	}else{
		hoverTool = noone;
	}
	
	if(instance_position(x, y, obj_bare_component)){
		hoverComp = instance_position(x, y, obj_bare_component)

	}else{
		hoverComp = noone;
	}
	
	
	if(hoverNode != noone){
		if(hoverNode.actionNode){
			sprite_index = spr_cursor_action;	
		}else{
			if(hoverNode.moveNode){
				sprite_index = spr_cursor_move; 
			}else{
				sprite_index = spr_cursor;	
			}
			
		}
		
	}else{
		sprite_index = spr_cursor;	
	}
	
	if(state == "action target"){
		cursorSprite = spr_cursor_action;	
		
	}else{
		cursorSprite = spr_cursor;		
	}


}
