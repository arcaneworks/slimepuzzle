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
			tempStruct = global.componentDB.shooter2; 
		break;
		
		case "CF":
			tempStruct = global.componentDB.fighter; 
		break;
		
		case "CB":
			tempStruct = global.componentDB.bomb; 
		break;
		
		case "CT":
			tempStruct = global.componentDB.thumper;
			
		break;
			
		case "CE":
			tempStruct = global.componentDB.eye;
		break;
		
		case "CX":
			tempStruct = global.componentDB.slime;
		break;
			
		case "ER":
			tempStruct = global.componentDB.rock; 
		break;
	
		case "ED":
			tempStruct = global.componentDB.director;
		break;
		

	}
	
	if(tempStruct != noone){
		set_component_info(tempStruct, component);
	}
}
