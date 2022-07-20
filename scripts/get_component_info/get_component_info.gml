//assigns a component instance variables based on the component database
//based on their component code. Usually used for level editor "bare_component"s
function get_component_info(component, componentCode){
	
		var tempStruct = noone;
		
	switch(componentCode){
		case "CA":
			tempStruct = global.componentDB.archer; 
		break; 
		
		case "CB":
			tempStruct = global.componentDB.bomb; 
		break;
		
		case "CC":
			tempStruct = global.componentDB.cleric; 
		break;
		
		case "CD":
			tempStruct = global.componentDB.bigslime;
		break;

		case "CE":
			tempStruct = global.componentDB.eye;
		break;
		
		
		case "CF":
			tempStruct = global.componentDB.fighter; 
		break;
		
		
		case "CK":
			tempStruct = global.componentDB.knight; 
		break; 
		
		
		case "CP":
			tempStruct = global.componentDB.shooter2; 
		break;
		
		case "CQ":
			tempStruct = global.componentDB.brawler;
		break;
		case "CR":
			tempStruct = global.componentDB.rogue; 
		break;
			
		case "CS":
			tempStruct = global.componentDB.shooter; 
		break;
		
		case "CT":
			tempStruct = global.componentDB.thumper;
			
		break;
		
		case "CW":
			tempStruct = global.componentDB.wizard; 
		break; 
		
		case "CX":
			tempStruct = global.componentDB.slime;
		break;
		
		case "CY": 
			tempStruct = global.componentDB.cybermage; 
		break;
		
		
			
		
		
		
		case "ER":
			tempStruct = global.componentDB.rock; 
		break;
	
		case "ED":
			tempStruct = global.componentDB.director;
		break;
		
		case "EF":
			tempStruct = global.componentDB.firedirector;
		break;
		case "EW":
			tempStruct = global.componentDB.wall;
		break;
		
		case "EP":
			tempStruct = global.componentDB.crate;
		break;
		
		case "EB":
			tempStruct = global.componentDB.barrel;
		break;
		
		
		

	}
	
	if(tempStruct != noone){
		set_component_info(tempStruct, component);
	}
}
