/// @description Insert description here
// You can write your code in this editor
ecks=x

/// @description	input into: menu_text_array, button_click_array
/// @function		auto_button_text(_text_array,_x,_y,_text,_clicky,_button_array,_halign,_xscale,_yscale,_angle,_device)
/// @arg			_text_array
/// @arg			_x
/// @arg	{real}	_y
auto_button_text=function(_text_array,_x,_y,_text,_clicky=false,_button_array=[],_halign=fa_center,_xscale=.4,_yscale=.4,_button_xscale=1,_button_yscale=1,_angle=0,_device=0){
	if _clicky=true{
		var _dx = .5*_xscale*(string_width(_text))*_button_xscale
		var _dy = .44*_yscale*(string_height(_text))*_button_yscale
		if _halign = fa_center { array_push(_button_array,[_device,_x , _y , _dx,_dy])}
		else if _halign= fa_left{array_push(_button_array,[_device,_x+_dx,_y,_dx,_dy])}
		else if _halign=fa_right{array_push(_button_array,[_device,_x-_dx,_y,_dx,_dy])}
	}
	array_push(_text_array,[_halign,_x,_y,_text,_xscale,_yscale, _angle])
}
	
	
menu_text_array=[]
button_click_array=[]

		auto_button_text(menu_text_array,320,80,"Welcome",,,,0.7,0.7)
		auto_button_text(menu_text_array,320,153, "Play game?",true,button_click_array,,,,2.2,2.2)
		auto_button_text(menu_text_array,407,269, "Extra",true,button_click_array,,,,1.1,1.1)
		auto_button_text(menu_text_array,320,217, "Change Characters?",true,button_click_array,,,,2.2,2.2)
		auto_button_text(menu_text_array,277,269, "Preview Character?",true,button_click_array,,,,1.1,1.1)
		
#region	auto_array_loop:	universal 2d array function applier
/// @description	running another function through each array in a bigger array (auto_text,button_click_check)
///
/// optionally returning an array with possibly returned values from the other function. use returned array with runtime function array_get_index or my truth function
///
/// ..
/// @function		auto_array_loop(_bigarray,_arrayfunction,_return)
/// @arg			_bigarray
auto_array_loop=function(_bigarray,_array_function,_return=false,_bool=true){
	var _i=0;
	var _returned_array=[];var _returned_object//if _return=true{}
	repeat (array_length(_bigarray)){
		if _return=true{
			_returned_object=_array_function(_bigarray[_i])
			if _bool=true{_returned_object=bool(_returned_object)}
			array_push(_returned_array,_returned_object)
		}
		else{_array_function(_bigarray[_i])}
		_i+=1}
	if _return=true{return _returned_array;}
}

var _btw_same_thing=function(){
	var _i=0;
	var _returned_array=[];var _returned_object//if _return=true{}
	repeat (array_length(_bigarray)){
		_returned_object=_array_function(_bigarray[_i])
		if _bool=true{_returned_object=bool(_returned_object)}
		array_push(_returned_array,_returned_object)
		_i+=1}
	return _returned_array;
}//so btw same thing? returning things is always optional...
//	????	////	running another function through each element in an array (auto_text,button_click_check)		//_any_d_array
#endregion
#region	auto_text:			auto text maker
/// @description	takes values from an array like _text_array, menu_text_array
///
/// all it does is it draws text... like for the menu
///
/// ..
/// @function		auto_text(_array)
auto_text=function(_array){
	var _halign=_array[0]
	var _x=_array[1]
	var _y=_array[2]
	var _text=_array[3]
	var _xscale=_array[4]
	var _yscale=_array[5]
	var _angle=_array[6]
	draw_set_halign(_halign);draw_text_transformed(_x,_y,_text,_xscale,_yscale, _angle)
}
#endregion
draw_set_font (fnt_button)
draw_set_valign(fa_middle)

//menu[0]=true

#region	button_click_check:	button click checker
/// @description	takes values from an array like _button_array, button_click_array, 
///
/// checks if user device (mouse) is clicking/pressing on button
/// 
/// returns rectangle_in_rectangle(runtime function)
///
/// ..
/// @function		button_click_check(_array)
button_click_check=function(_array){
	var _device=_array[0]
//if global.fakeclick=false{
	var _mx = device_mouse_x_to_gui(_device)
	var _my = device_mouse_y_to_gui(_device)
//}else if global.fakeclick=true{var _mx =-1; var _my= -1}
	var _x=		_array[1]
	var _y=		_array[2]
	var _dx=	_array[3]
	var _dy=	_array[4]
	//show_debug_message("_x, autocalculated, mousecheck, ratio: {0}, {1}, {2}, {3}",_x,_x-(_x-_dx),(_x-_mx),(_x-_mx)/(_x-(_x-_dx)))
	//show_debug_message("_y, autocalculated, mousecheck, ratio: {0}, {1}, {2}, {3}",_y,_y-(_y-_dy),(_y-_my),(_y-_my)/(_y-(_y-_dy)))
	return rectangle_in_rectangle(_x-_dx,_y-_dy,_x+_dx,_y+_dy,_mx-1,_my-1,_mx+1,_my+1)
}
#endregion

//easiest way to check what should be happenig (is) by using arrays with boolean values
#region truth
/// @description	returns array_get_index(_array ,true)
///
/// ..
/// @function		truth(_array)
truth=function(_array){return array_get_index(_array ,true)}						#endregion
