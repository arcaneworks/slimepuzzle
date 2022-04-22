//assigns a component instance variables based on the component database
//based on their component code. Usually used for level editor "bare_component"s
function get_component_info(component, componentCode){
	
		var tempStruct = noone;
		
	switch(componentCode){
		case "CK":
			tempStruct = global.componentDB.knight; 
		break; 
		
		case "CW":
			tempStruct = global.componentDB.wizard; 
		break; 
		
		case "CA":
			tempStruct = global.componentDB.archer; 
		break; 
		
		case "CR":
			tempStruct = global.componentDB.rogue; 
		break;
		
		case "CC":
			tempStruct = global.componentDB.cleric; 
		break;
		
		case "CS":
			tempStruct = global.componentDB.shooter; 
		break;
		
		case "CP":
			tempStruct = global.componentDB.shooterFire; 
		break;
		
		case "CF":
			tempStruct = global.componentDB.fighter; 
		break;
		
		case "CB":
			tempStruct = global.componentDB.bomb; 
		break;
		
		case "ER":
			tempStruct = global.componentDB.rock; 
		break;
		
		case "EA":
			tempStruct = global.componentDB.directorLD;
		break;
		
		case "ES":
			tempStruct = global.componentDB.directorRD;
		break;
		
		case "ED":
			tempStruct = global.componentDB.directorUL;
		break;
		
		case "EF":
			tempStruct = global.componentDB.directorUR;
		break;
	}
	
	if(tempStruct != noone){
		component.infoText = tempStruct.infoText;
		component.class = tempStruct.class;
		component.sprite_index = tempStruct.sprite; 
		component.portSpr = tempStruct.portSpr; 
		component.move = tempStruct.move;
		
	}
}
