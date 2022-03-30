///@param spr
///@param tempX
///@param tempY
///@param xScale
///@param yScale
///@param loop?
///@param rot
///@param color
///@param alpha
///@param goal
///@param speed
function draw_sprite_animated(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) {


	///@description Draws a sprite, then cycles through the sprite's image index. 



	var spr = argument0; //sprite to animated	
	var tempX = argument1; // x coord
	var tempY = argument2; // y coord
	var xScale = argument3;
	var yScale = argument4;  
	var loop = argument5; //boolean - if sprite loops or not 
	var rot = argument6; //rotation 
	var color = argument7; 
	var alpha = argument8;
	var goal = argument9; // goal frame, when set to -1 it gets the last frame of sprite.
	var spd = argument10; // speed of the animation. .10 is pretty good. 
	var variable = argument11; // the IMG Variable to change!


	if(goal == -1){
		goal = sprite_get_number(spr);
	}

	if(loop == true){
		if(variable >= goal){
			variable = 0;
		}else{
			variable += spd;	
		}	
	}else{
		if(variable >= goal){
			exit;
		}else{
			variable += spd;
		}
	}
		
	draw_sprite_ext(spr, floor(variable), tempX, tempY, xScale, yScale, rot, color, alpha);



}
