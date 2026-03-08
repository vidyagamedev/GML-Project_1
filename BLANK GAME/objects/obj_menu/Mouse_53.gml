/// @description Insert description here
// You can write your code in this editor


var _returned_extra_array	= auto_array_loop(extra_button_array,button_click_check,true)
switch truth(menu){
	case 1:{
		if (instance_exists(a_Player_GUI)) {
			if truth(_returned_extra_array)=0{
				instance_destroy(a_Player_GUI)
				menu_change(0)
			}
		}
	}break
	case 8: case 9: {
		var _r=truth(_returned_extra_array)
		if _r>=0{
			instance_destroy(a_Player_GUI)
			instance_destroy(obj_gui_sprite)
			menu_change(_r)
		}
	}break
}


	var _mx = device_mouse_x_to_gui(0)
	var _my = device_mouse_y_to_gui(0)
	show_debug_message("x:{0}",_mx)
	show_debug_message("y:{0}",_my)
