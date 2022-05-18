///Calcs total width of valuebar based on the MaxValue, which has to be >2
function valuebar_get_width(startSpr, middleSpr, endSpr, maxValue) {

	///@param startSpr 
	///@param middleSpr
	///@param endSpr 
	///@param maxValue 






	var startWidth = sprite_get_width(startSpr);  //width of start section
	var endWidth = sprite_get_width(endSpr); //width of middle sectiion
	var midWidth = 4; //width of end section 
	var totalWidth;




	///DRAWS FRAME BASED ON MAX VALUE
	for(var i = 0; i < maxValue; i++){
		if(maxValue == 1){
			totalWidth = sprite_get_width(spr_valuebar_1hp);	
		}
	
		if(maxValue == 2){
			totalWidth = startWidth + endWidth;
		}
		
		if(maxValue > 2){
			totalWidth = startWidth + (midWidth *(maxValue - 2)) + endWidth;
			
			var kk = 1; 
			
		}
	}

	return totalWidth 




}
