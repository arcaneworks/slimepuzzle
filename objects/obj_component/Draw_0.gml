


#region UI MOVEMENT LINES

if(global.cursor.hoverNode != noone){
	if(global.cursor.selectedActor == id){
			tempNode = global.cursor.hoverNode;
	
		if(global.cursor.state== "move"){
			if(tempNode.moveNode){
				current = global.cursor.hoverNode;
	
				//step through every node in the chain, parent to partent, until we reach the actors node.
				while(current.parent != noone){
					var offset = node_size/2
					draw_line_width_color(current.x + offset, current.y + offset, current.parent.x + offset, current.parent.y + offset, offset/4, c_lime, c_lime);
		
					current = current.parent;
				}
	
			}	
		}
	}else{
	
		if(global.cursor.target == id){
			tempNode = global.cursor.hoverNode;
		
			if(global.cursor.state== "action decision" && global.cursor.readiedAction.moveAction){
		
		
				if(tempNode.moveNode){
			
					current = global.cursor.hoverNode;
	
					//step through every node in the chain, parent to partent, until we reach the actors node.
					while(current.parent != noone){
						var offset = node_size/2
						draw_line_width_color(current.x + offset, current.y + offset, current.parent.x + offset, current.parent.y + offset, offset/4, c_purple, c_purple);
		
						current = current.parent;
					}
				}	
			}
		}
	
	}
}

#endregion

#region BOOLEAN EFFECTS (such as shake)

if(shake){
	var ranX = random_range(-3,3),
	 ranY = random_range(-3,3);

}else{
	ranX = 0;
	ranY = 0;
}

var spriteX = x + ranX,
spriteY = y + ranY;



#endregion



#region DRAWS SPRITES (and outlines)

//if I am the selectedActor, make my outline green
if(global.cursor.selectedActor != noone && global.cursor.selectedActor == id){  //draws outline sprite when component is selected 
	
	if(canAct){
		outlineCol = c_lime;
	}
	draw_sprite_outlined(sprite_index, -1, spriteX, spriteY, sprXscale, sprYscale, image_angle, color, outlineCol, alpha) //draws outlined sprite when component is hovered
}else{
	
	
	
	//if i hover over an actor
	if(global.cursor.hoverNode != noone && global.cursor.hoverNode.occupant != noone && global.cursor.hoverNode.occupant == id){
		
		if(canAct){
			outlineCol = c_yellow;
		}
		
	
		draw_sprite_outlined(sprite_index, -1, spriteX, spriteY,  sprXscale, sprYscale, image_angle, color, outlineCol, alpha)
	}else{
		if(global.gameObj.currActor == id && enemy){
			
			outlineCol = c_red;

			draw_sprite_outlined(sprite_index, -1, spriteX, spriteY,  sprXscale, sprYscale, image_angle, color, outlineCol, alpha)
		}else{
		//draw the sprite regularly
		draw_sprite_ext(sprite_index, -1, spriteX, spriteY,  sprXscale, sprYscale, image_angle, color, alpha);
		
		}
	}
}

#endregion

draw_set_color(c_white)

if(incapacitated){
	draw_sprite_ext(sprite_index, -1, spriteX, spriteY, sprXscale, sprYscale, image_angle, c_black, .5);
}