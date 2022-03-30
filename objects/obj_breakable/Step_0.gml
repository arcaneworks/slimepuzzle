event_inherited();

if(breaking){
	for(ii = 0; ii < 5; ii += 1){
		
		instance_create_layer(x, y , "Instances", particle);			
			
	}
	
	durability -= 1;
	breaking = false;
		
}

if(durability <= 0){
	
		if(contents != noone){
			ds_list_add(obj_portrait.inventory, contents);
		}
		instance_destroy();
	
}

if(mouse_over() && mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1)){
	breaking = true;	
}