if(img >= sprite_get_number(sprite)){
			chestState = "closed";
			img = 0;
		}else{
			img += imgSpd;
		}