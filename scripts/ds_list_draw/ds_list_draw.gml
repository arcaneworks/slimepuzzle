function ds_list_draw(argument0, argument1, argument2, argument3, argument4, argument5) {

	///draws individual values of a ds list 

	///@param0 list 
	///@param1 x 
	///@param2 y 
	///@param3 xOffset
	///@param4 yOffset
	///@param5 title?    

	var list = argument0; // list to draw
	var posX = argument1; // x position to draw list
	var posY = argument2; // y position to draw list
	var offsetX = argument3; // x space between values
	var offsetY = argument4; // y space between values
	var title = argument5; // this is a boolean, if true then it makes the first item on the list the title of the ds list and draws it bigger than the others 

	if(title = true){
	
		for(var i = 0; i < ds_list_size(list); i++){
			var item = ds_list_find_value(list, i);
			if(i = 0){
				draw_text(posX + i * offsetX, posY + i * offsetY, item);
			}else{
				draw_text(posX + i * offsetX, posY + i * offsetY, item);
			}
		}

	}else{

		for(var i = 0; i < ds_list_size(list); i++){
			var item = ds_list_find_value(list, i);
			draw_text(posX + i * offsetX, posY + i * offsetY, item);
		}
	}


}
