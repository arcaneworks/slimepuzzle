// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_damage_class(){
	switch(damageClass){
		case "default":
			hp -= damage;
			damaged = true;
			shake = true;	
		break;
		
		
		case "fire weak":
			if(damageType == "fire"){
				hp -= damage;
				damaged = true;
				shake = true;
				
			}
		
		break;
		
	}
}