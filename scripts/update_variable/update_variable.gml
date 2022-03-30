function update_variable(argument0, argument1, argument2, argument3) {

	///@param loop?
	///@param img
	///@param goal
	///@param speed

	var loop = argument0; //boolean - if sprite loops or not 
	var img = argument1; // current image of sprite 
	var goal = argument2; // goal frame, when set to -1 it gets the last frame of sprite.
	var spd = argument3; // speed of the animation. .10 is pretty good. 



	if(loop == true){
		if(img >= goal){
			img = 0;
		}else{
			img += spd;	
		}	
	}else{
		if(img >= goal){
			
		}else{
			img += spd;
		}
	}
		
	return img


}
