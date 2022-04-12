// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_confirm_box(xx, yy, textString, decision, caller){

		textString_ = textString; 
		decision_ = decision; 
		caller_ = caller

	with(instance_create_layer(xx, yy, "Instances", obj_confirm)){
		self.decision = other.decision_;
		self.textString = other.textString_;
		self.caller = other.id;
	}
		

}