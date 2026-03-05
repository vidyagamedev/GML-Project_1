// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function menu_functions(){

#region auto_button_text:	epic button creator
/// @description	pushes button info to: menu_text_array, button_click_array
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
#endregion	
#region	auto_array_loop:	universal 2d array function applier
/// @description	running another function through each array in a bigger array (auto_text,button_click_check)
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
#region truth
//easiest way to check what should be happening, by using arrays with boolean values
/// @description	returns array_get_index(_array ,true)
///
/// ..
/// @function		truth(_array)
truth=function(_array){return array_get_index(_array ,true)}						
#endregion

menu_list=function(_array,_p=1,_text_array,_button_array,_menu4_check=false){
	var _l=array_length(_array)
	if ((_p+1)*5)<_l{_l=10}
	for (var i = ((_p-1)*5); i < _l; i += 1){
		var _a=+160*((i-(_p-1)*5) div 5)
		var _b=5*(i div 5)
		auto_button_text ( _text_array,227+_a, 123+(i-_b)*29, _array[i],true,_button_array,,,,1.2)

		if _menu4_check{comrades_check(_text_array,i,_a,_b)}
	}
}
comrades_check=function(_text_array,i,_a,_b){
		var _check = global.selection[i+1] ? "  X"  : "-./"
		auto_button_text(_text_array,303+_a, 123+(i-_b)*29, _check , , , , , , 1.2 )
}
page_buttons=function(_button_array,_menu_page){
		switch truth(_button_array){
			case 0:{
				if _menu_page!=1{_menu_page-=1}
			}break
			case 1:{
				_menu_page+=1
			}break
		}
		return _menu_page
}
sprite_list=function(_p=1){
	var _current_sprite=obj_gui_sprite.sprite_index
	var _start=((_p-1)*5)

	var _l=sprite_get_number(_current_sprite)
	if ((_p+1)*5)<_l{_l=10+_start}
	for (var i = _start; i < _l; i += 1){
		var _b=((i-(_p-1)*5) div 5)
		var _a=((i-(_p-1)*5) mod 5)
		draw_sprite(_current_sprite, i, 178.9 + _a * 69, 123 + _b*63);
	}
}
pages=function(menu_array,_button_array,_menu_page){
			auto_button_text(menu_array,417,273, "<-",true,_button_array)
			auto_button_text(menu_array,471,273, "->",true,_button_array)
			auto_button_text(menu_array,444,273, _menu_page)
}
menu_change=function(_menu){
	menu=[];
	menu[_menu]=true;
	menu_script()
}

menu_script=function(){
menu_text_array=[]
button_click_array=[]
sub_button_array=[]
extra_button_array=[]

if nav>0{auto_button_text(menu_text_array,12,345," Navigation Shortcuts:",true,,fa_left)}
auto_button_text(menu_text_array,628,345,"0.2 Preview",true,,fa_right)

	switch truth(menu){
		case 0:{
			auto_button_text(menu_text_array,320,64,"Welcome",,,,0.7,0.7)
			auto_button_text(menu_text_array,320,126, "Play game?",true,button_click_array,,,,2.2,2.2)
			auto_button_text(menu_text_array,320,186, "Preview Characters?",true,button_click_array,,,,2.2,2.2)
			auto_button_text(menu_text_array,320,246, "Modify Game?",true,button_click_array,,,,2.2,2.2)
		}break
		case 1:{
			var _array=folder_finder(working_directory+"duude/file/")
			if !(instance_exists(a_Player_GUI)){
				auto_button_text(menu_text_array,320,64,"Character Preview",,,,0.7,0.7)
				//character_list_preset(menu1_page)
				//extra_button_array
				menu_list(_array,,menu_text_array,sub_button_array)
			}
			else{
				var _char= (a_Player_GUI.bodyid)-1
				auto_button_text(menu_text_array,320,64,_array[_char],,,,0.7,0.7)
				auto_button_text(menu_text_array,320,100,"View Animations and Graphics?",true,sub_button_array)
				auto_button_text(menu_text_array,177,345," Main Menu",true,extra_button_array,fa_left)
			}
		}break

		case 2:{
			auto_button_text(menu_text_array,320,64,"Game Modification",,,,0.7,0.7)
			auto_button_text(menu_text_array,320,126, "Modify Characters?",true,button_click_array,,,,2.2,2.2)
			auto_button_text(menu_text_array,320,186, "Modify Background?",true,button_click_array,,,,2.2,2.2)
			auto_button_text(menu_text_array,320,246, "Modify Level?",true,button_click_array,,,,2.2,2.2)
		}break
		case 3:{
			auto_button_text(menu_text_array,320,64,"Character Modification",,,,0.7,0.7)
			auto_button_text(menu_text_array,320,126, "Choose Comrades?",true,button_click_array,,,,2.2,2.2)
			auto_button_text(menu_text_array,320,186, "Customize Characters?",true,button_click_array,,,,2.2,2.2)
			auto_button_text(menu_text_array,320,246, "Create New Character?",true,button_click_array,,,,2.2,2.2)
		}break
		case 4:{
			auto_button_text(menu_text_array,320,64,"Choosing Comrades",,,,0.7,0.7)
			var _array=folder_finder(working_directory+"duude/file/")
			menu_list(_array,,menu_text_array,sub_button_array,true)
			//character_list_preset(menu4_page,true)
		}break
		case 5:{
			auto_button_text(menu_text_array,320,64,"Customizing Characters",,,,0.7,0.7)
			character_list_preset(menu5_page)
		}break
		case 6:{
			//menu_list=function(_array,_p=1,_text_array,_button_array,_menu4_check=false){
			//selected_char
			var _array=folder_finder(working_directory+"duude/file/")
			//auto_button_text(menu_text_array,320,64,"Customizing "+_array[selected_char],,,,0.7,0.7)
			auto_button_text(menu_text_array,320,64,_array[selected_char],,,,0.7,0.7)
			if (instance_exists(a_Player_GUI)){
				//auto_button_text(menu_text_array,320, 100,"Customize Animations and Parameters?",true,button_click_array)
			}
			else{
				var _animationtype=["Attacking","Falling","Standing","Jumping","Moving","Attack Hitbox","","","","Parameters"]
				menu_list(_animationtype,,menu_text_array,sub_button_array)
				auto_button_text(menu_text_array,369, 273,"Preview",true,button_click_array)
			}
		}break
		case 7:{
			var _array=folder_finder(working_directory+"duude/file/")
			var _animationtype=["Attacking","Falling","Standing","Jumping","Moving","Attack Hitbox","","","","Parameters"]
			//auto_button_text(menu_text_array,320,64,_array[selected_char]+" "+_animationtype[selected_action],,,,0.7,0.7)
			auto_button_text(menu_text_array,320,42,_array[selected_char],,,,0.369,0.369)
			auto_button_text(menu_text_array,320,69,_animationtype[selected_action],,,,0.7,0.7)
			//auto_button_text(menu_text_array,320, 230,"Edit Animation?",true,button_click_array)
			auto_button_text(menu_text_array,234, 230,"Adjust Positioning",true,button_click_array)
			auto_button_text(menu_text_array,388, 230,"Change Animation?",true,button_click_array)
		}break
		case 8:{
			var _array=folder_finder(working_directory+"duude/file/")
			auto_button_text(menu_text_array,320,64,_array[selected_char-1],,,,0.7,0.7)

			var _animationtype=["Attacking","Falling","Standing","Jumping","Moving","Attack Hitbox"]
			//,"","","","Parameters"]
			menu_list(_animationtype,,menu_text_array,sub_button_array)
			//auto_button_text(menu_text_array,369, 273,"Preview",true,button_click_array)
			auto_button_text(menu_text_array,177,345," Main Menu",true,extra_button_array,fa_left)	//see global click event
			auto_button_text(menu_text_array,266.6,345,"- Character Preview",true,extra_button_array,fa_left)
		}break
		case 9:{
			var _array=folder_finder(working_directory+"duude/file/")
			var _animationtype=["Attacking","Falling","Standing","Jumping","Moving","Attack Hitbox"]
			auto_button_text(menu_text_array,320,42,_array[selected_char-1],,,,0.369,0.369)
			auto_button_text(menu_text_array,320,69,_animationtype[selected_action],,,,0.7,0.7)
			pages(menu_text_array,sub_button_array,page_9)
			auto_button_text(menu_text_array,177,345," Main Menu",true,extra_button_array,fa_left)
			auto_button_text(menu_text_array,266.6,345,"- Character Preview",true,extra_button_array,fa_left)
		}break
		case 9000:{
			
		}break
	}

	if truth(menu)!=0{
		auto_button_text(menu_text_array,177, 273,"  <--  ",true,button_click_array)
		if !(truth(menu)){//-1
			if menu_code=0{
				auto_button_text(menu_text_array,320,129,"Coming Soon!",,,,0.7,0.7)}
			else if menu_code=1{
				auto_button_text(menu_text_array,320,129,"ETA: in one week, probably",,,,0.7,0.7)}
			else if menu_code=2{
				auto_button_text(menu_text_array,320,129,"Coming VERY Soon!",,,,0.7,0.7)}
		}
	}
}



character_list_preset=function(_menu_page,_menu4_check=false){
	character_list(_menu_page,menu_text_array, sub_button_array, extra_button_array, working_directory+"duude/file/",_menu4_check)
}
character_list=function(_menu_page,menu_array,_list_array,_button_array,_directory,_menu4_check=false){
			var _array=folder_finder(_directory)
			menu_list(_array,_menu_page,menu_array,_list_array,_menu4_check)
			//lastpage = ceil((array_length(characters))/5);
			auto_button_text(menu_array,417,273, "<-",true,_button_array)
			auto_button_text(menu_array,471,273, "->",true,_button_array)
			auto_button_text(menu_array,444,273, _menu_page)
}

//sprite_list=function(_array,_p=1,_text_array,_button_array,_menu4_check=false){

}
