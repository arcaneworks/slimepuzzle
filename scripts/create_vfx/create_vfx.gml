///creates instance of vfx that destroys itself after completion
function create_vfx(argument0, argument1, argument2, argument3) {


	///@param sprite
	///@param x
	///@param y
	///@param layer 


	var sprite = argument0,
	tempX = argument1,
	tempY = argument2,
	tempLayer = argument3,
	vfx;




	vfx = instance_create_layer(tempX, tempY, tempLayer, obj_vfx)
	vfx.sprite = sprite;
	
	return vfx;

						


}
