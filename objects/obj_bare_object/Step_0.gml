	
if(tool){
	if(obj_sub_toolbar_write.visible == false){
		visible = false;	
		hoverable = false;
	}else{
		if(obj_sub_toolbar_write.selectedTab.tabType == tabType){
			visible = true;
			hoverable = true;
		}else{
			hoverable = false;
			visible = false; 			
		}
	}
}

if(mouse_over() || obj_sub_toolbar_write.selectedObjTool == id){
	hovered = true;
}else{
	hovered = false;
	
}