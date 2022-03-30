///@func draw_ap(apSprite, apX, apY, buffer, ap, maxAp)
///@descrip draws the ap bubbles according to the the hovered/selected actor's "ap" instance variable. 
function draw_ap(apSprite, apX, apY, buffer, ap, maxAp) {



	var sprWidth = sprite_get_width(apSprite);


	for(var kk = 0; kk < maxAp; kk++){
		draw_sprite_ext(apSprite, 0, apX + sprWidth * kk + buffer * kk, apY, 1, 1, 0, c_gray, 1);
	
	
	}


	for(var kk = 0; kk < ap; kk++){
		draw_sprite_ext(apSprite, 0, apX + sprWidth * kk + buffer * kk, apY, 1, 1, 0, c_white, 1);
	}


}
