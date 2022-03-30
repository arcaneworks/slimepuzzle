function apply_status() {

	if(statusIns){
				
				
		switch(status){	
			case "burning":
		
				if(statusCt > 0){
					damage = 1;
					applyDamage = true;
				}
		
			break;	
		}
	
		statusCt--;
	
		if(statusCt <= 0){
			instance_destroy(statusIns);
			statusIns = noone;	
			status = noone;
		}
	}
}
