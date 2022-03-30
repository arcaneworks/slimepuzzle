///@param GridX
///@param GridY
///@param component
function place_component(argument0, argument1, argument2) {

	//places a COMPONENT INSTANCE at a NODE based on MAPX  (STARTS AT

	var gridX = argument0;
	var gridY = argument1; 
	var node = map[gridX, gridY];
	var component = argument2; 

	instance_create_layer(node.x, node.y, "Instances", component);
	node.occupant = component; 



}
