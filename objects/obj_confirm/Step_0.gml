
decBoxW = 75; 
decBoxH = 24;
buffer = 7;

if(decision){
	
	var decWidth = decBoxW * 2 + buffer;
	var decBoxStartX = x + .5 * width - .5 * decWidth; 
	
	decBox1X = decBoxStartX;
	decBox1Y = y + height - buffer * 2 - decBoxH;
	decBox2X = decBoxStartX + decBoxW + buffer;
	decBox2Y = y + height - buffer * 2 - decBoxH;
	
	var colBox1 = collision_rectangle(decBox1X, decBox1Y + buffer, decBox1X + decBoxW, decBox1Y + decBoxH + buffer, global.cursor, false, false);
	var colBox2 = collision_rectangle(decBox2X, decBox2Y + buffer, decBox2X + decBoxW, decBox2Y + decBoxH + buffer, global.cursor, false, false);
	
	if(colBox1){
		decBox1Color = c_green;
		if(mouse_check_button_pressed(mb_left)){
			if(caller != noone){
				caller.confirmDec = true;	
			}
			instance_destroy(id);	
		}	
	}else{
		decBox1Color = c_black;	
	}
	
	if(colBox2){
		decBox2Color = c_green; 
		if(mouse_check_button_pressed(mb_left)){
				
			caller.confirmDec = false; 
			instance_destroy(id);
		}
	}else{
		decBox2Color = c_black;		
	}
	
}else{
	
	decBoxX = x + .5 * width - .5 * decBoxW; 
	decBoxY = y + height - buffer * 2 - decBoxH;
	
	var colBox = collision_rectangle(decBoxX, decBoxY + buffer, decBoxX + decBoxW, decBoxY + decBoxH + buffer, global.cursor, false, false);
	
	if(colBox){
		decBoxColor = c_green; 
		if(mouse_check_button_pressed(mb_left)){	
			instance_destroy(id);	
		}	
	}else{
		decBoxColor = c_black;	
	}
	
}



