
function draw_valuebar_sectioned(startSpr, middleSpr, endSpr, bkgSprite, originX, originY, 
bkgOffset, maxValue, value, img, color, alpha, scale) {



	var startWidth = sprite_get_width(startSpr);
	var endWidth = sprite_get_width(endSpr);
	var midWidth = 4;
	var totalWidth = 0;

if(maxValue == 1){
			draw_sprite_ext(spr_valuebar_1hp, 0, originX, originY, 1, 1, 0, c_white, alpha);
			
		}


	///DRAWS FRAME BASED ON MAX VALUE
	for(var i = 1; i < maxValue; i++){
		
		
		if(maxValue == 2){
		
			//draws 2 cell frame
			draw_sprite_ext(startSpr, img, originX, originY, scale, scale, 0, color, alpha);	
			draw_sprite_ext(endSpr, img, originX + startWidth, originY, scale, scale, 0, color, alpha);
			totalWidth = startWidth + endWidth;
		
		
		}else{
			
			if(maxValue > 2){
				
				draw_sprite_ext(startSpr, img, originX, originY, scale, scale, 0, color, alpha);	
				draw_sprite_ext(middleSpr, img, originX + startWidth + (midWidth * (i - 1)), originY, scale, scale, 0, color, alpha);
				draw_sprite_ext(endSpr, img, originX + startWidth + (midWidth * (maxValue - 2)), originY, scale, scale, 0, color, alpha);
		
				totalWidth = startWidth + (midWidth *(maxValue - 2)) + endWidth;
			}
		}
	}
	if(maxValue > 1){
		for(i = 0; i < value; i++){
	
			draw_sprite_ext(bkgSprite, img, originX + bkgOffset + (midWidth * i), originY + bkgOffset, scale, scale, 0, color, alpha);
		}
	}




}
