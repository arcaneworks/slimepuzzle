
#region SETS Visibility of object and assigns pActor, sets variables based on pActor

if(interface.selectedActor != noone && interface.selectedActor.actor){ //if there is SELECTED ACTOR
	pActor = interface.selectedActor;
	visible = true;

}else{
	
	if(interface.hoverNode != noone){ //if you are hovering over a NODE
	
		if(interface.hoverNode.occupant != noone && interface.hoverNode.occupant.actor){ //and that node has an OCCUPANT, which is an ACTOR
			pActor = interface.hoverNode.occupant;
			visible = true;	
	
		}else{
			pActor = noone;
			visible = false;
		
		}
	
	}else{
		
		visible = false;
		pActor = noone;
	}
		
}

#endregion

 
if(pActor){
	portraitSpr = pActor.portraitSpr;
	portraitWidth = sprite_get_width(portraitSpr) * scale;
	portraitHeight = sprite_get_height(portraitSpr) * scale;
	action1 = pActor.action;
	
	if(pActor.canAct){
		bgColor = c_olive;
		xMark = false
	}else{
		bgColor = c_gray;
		xMark = true;
	}
}else{
		
	
	
}
