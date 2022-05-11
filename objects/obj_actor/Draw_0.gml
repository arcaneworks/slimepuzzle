event_inherited();


//colors actor gray if it can't move && can't act
if(canAct || canMove){
	color = c_white;
}else{
	color = c_gray;
	outlineCol = c_gray;
}

if(defending){
	draw_set_alpha(.75);
	draw_sprite(spr_defend, -1,x, y);
	draw_set_alpha(1);
	
}

//if(ds_list_size(targetList > 0)){
	
//draw_text( x + 20, y, ds_list_size(targetList));	
	
//}




