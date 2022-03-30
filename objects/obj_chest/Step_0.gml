event_inherited();

if(position_meeting(mouse_x,mouse_y, self) && global.cursor.clickAble == true){
	hoverChest = true
	if(mouse_check_button_pressed(mb_left) || gamepad_button_check(0,gp_face1) && opened == false && canOpen){
		opened = true;
		chestState = "open";
	}
}else{
	hoverChest = false;
}

if(canOpen){
	color = c_white;
}else{
	color = c_gray;	
}
var node = map[gridX, gridY];




var inAreaList = ds_list_create();

//this way uses a collision list to determine which actors can open the chest.

var actorsInArea = collision_rectangle_list(node.x -  node_size, node.y -  node_size, node.x + node_size, node.y + node_size, obj_actor, false, false, inAreaList, true);
var unlocked = false;

	for(var kk = 0; kk < ds_list_size(inAreaList); kk++){
		var tempActor = ds_list_find_value(inAreaList, kk);
		
		if(tempActor == global.cursor.selectedActor && global.cursor.selectedActor.state == "idle"){
			canOpen = true; 
			color = c_white;
			unlocked = true;
			
			
			break;
		}
	}
	
	ds_list_clear(inAreaList);

if(unlocked == false){
	canOpen = false;
	color = c_gray
}

switch(chestState){
	
	#region CLOSED
	
	case "closed":
	
		if(timer >= 60){
			chestState = "shine"
			timer = 0;
		}else{
			timer += .1
		}
	
	break
	
	#endregion 
	
	#region SHINE
	
	case "shine":

		if(img >= sprite_get_number(spr_chest_shine1)){
			chestState = "closed";
			img = 0;
		}else{
			img += .1;
		}
	
	break;
	
	#endregion
	
	#region OPEN
	
	case "open":

		if(img >= sprite_get_number(spr_chest_open1)){
			
			chest_default();
			i_alpha = 0;
			i_img = 1;
			ready = true;
			chestState = "item reveal";
				
		}else{
				img += .1;
		}
	
	break;

	#endregion
	
	#region ITEM REVEAL
	
	case "item reveal":

	
		if(ready){ //if the animation is ready to display
			
			if(i_alpha < 1){ //and the item's alpha is less than one
				i_alpha += .025;			//add incrimentally to alpha value
			}
					
			if(i_y <= i_y - node_size){ //makes the item hover upwards 
				i_y --
			}else{
				i_timer += .1; // timer adds icrementally until 	
			}
				
		}
			
		if(i_timer >= 5){
			complete = 1;	//complete's animation 
		}
		
		if(complete == 1){
			chest_default();
			i_img = 1;
			chestState = "fadeout";
		}
	
	
	break;
		
	#endregion
	
	#region OPENED
	
		case "opened":
			if(hoverChest){
				img = 1;	
			}else{
				img = 0;	
			}
		
		break;
	
	#endregion	
	
	#region FADEOUT
	
		case "fadeout":
			if(alpha >= 0){
				alpha -= .05;	
				
			}else{
				if(i_alpha >= 0){
					i_alpha -= .025;
					
				}else{
					ds_list_add(obj_portrait.inventory, item)
					map[gridX,gridY].occupant = noone;
					instance_destroy(id);
				}
			
			}
		
		break;
	
	#endregion		
	
}


