

#region DRAWS frame and background 

draw_set_color(bgColor);
draw_set_alpha(bgAlpha);

draw_rectangle(x, y, x + frameWidth - 7, y + frameHeight , false);

draw_set_color(frameColor);
draw_set_alpha(1);

draw_resizable_ext(sprite, x, y, frameWidth, frameHeight, 0, 0);

draw_set_color(c_white);

if(canAct = false){
draw_line_color(x, y, x + frameWidth, y + frameHeight, c_red, c_red);	
draw_line_color(x, y+ frameHeight, x + frameWidth, y , c_red, c_red);		
}

#endregion

#region Draws Icon, Title, and Hotkey

	


#endregion 



