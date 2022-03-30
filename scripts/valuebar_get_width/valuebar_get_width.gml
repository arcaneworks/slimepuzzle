///Calcs total width of valuebar based on the MaxValue, which has to be >2
function valuebar_get_width(argument0, argument1, argument2, argument3) {

	///@param startSpr 
	///@param middleSpr
	///@param endSpr 
	///@param maxValue 



	var startSpr = argument0; //top left corner of frame_spr
	var middleSpr = argument1 //middle of frame
	var endSpr = argument2 //end of frame
	var maxValue = argument3;



	var startWidth = sprite_get_width(startSpr);  //width of start section
	var endWidth = sprite_get_width(endSpr); //width of middle sectiion
	var midWidth = sprite_get_width(middleSpr); //width of end section 
	var totalWidth;




	///DRAWS FRAME BASED ON MAX VALUE
	for(var i = 1; i < maxValue; i++){
	
	

		if(maxValue == 2){
		
		
			totalWidth = startWidth + endWidth;
		
		
		}else{
	
			totalWidth = startWidth + (midWidth *(maxValue - 2)) + endWidth;
		}
	}

	return totalWidth 




}
