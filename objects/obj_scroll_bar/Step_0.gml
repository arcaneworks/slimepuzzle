
x = obj_scroll_load_box.x + obj_scroll_load_box.width;
y = obj_scroll_load_box.y;
/// @description Insert description here
// You can write your code in this editor

scroll_percent = beadY/bar_height;

if (mouse_wheel_up () || mouse_wheel_down())
{
	if mouse_wheel_up()
		{
		if mouse_x < x // if our mouse is to the left of our scrollbar
			{
			beadY -= scroll_amount;
			}
		}
	if mouse_wheel_down(){
		if mouse_x < x
			{
			beadY += scroll_amount;
			}
		}
		
	beadY = clamp(beadY, y, y+ (bar_height - 11));
	bead.y = beadY;
	bead.moved = true;
	bead.yy = beadY - bead.topLimit;	
	bead.percentage = clamp(round((bead.yy/(bead.bottomLimit - bead.topLimit)) * 100),0,100);
}	
//else if active == true // dragging with mouse
//	{
//	beadY = mouse_y - y;
//	}	
