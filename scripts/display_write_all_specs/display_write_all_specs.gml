/// @description display_write_all_specs(x,y);
/// @param {real} x
/// @param {real} y
function display_write_all_specs(argument0, argument1) {
	var _str="";
	_str+=display_write_specs(DisplayEnum.screen)+"\n";
	_str+=display_write_specs(DisplayEnum.window)+"\n";
	_str+=display_write_specs(DisplayEnum.gui)+"\n";
	_str+=display_write_specs(DisplayEnum.app_surface)+"\n";
	_str+=display_write_specs(DisplayEnum.view)+"\n";
	draw_text(argument0,argument1,_str);






}
