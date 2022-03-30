

if(sprite != noone){
	if(img > sprite_get_number(sprite) - 1){
		instance_destroy();			
	}else{
		img += imgSpd;
	}
}