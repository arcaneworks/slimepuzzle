y = camera_get_view_y(view_camera[0]) + 300 + (.5 * camera_get_view_height(view_camera[0]));
x = camera_get_view_x(view_camera[0]) + obj_portrait.portraitWidth * 2;

if(obj_portrait.pActor != noone){
	
	var action = obj_portrait.pActor.action;
	iconSpr = action.info.iconSpr;	
	
	iconWidth = sprite_get_width(iconSpr);
	iconHeight = sprite_get_height(iconSpr);
	
	title = action.info.title;
	titleWidth = string_width(title);
	titleHeight = string_height(title);
	
	
	if(!obj_portrait.pActor.canAct){
		canAct = false;	
		bgColor = c_gray;
	}else{
		canAct = true;	
		bgColor = c_teal;
	}
	
}

if(obj_portrait.visible){
	visible = true;	
}else{
	visible = false;
}

