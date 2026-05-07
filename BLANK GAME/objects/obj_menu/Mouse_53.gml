/// @description Insert description here
// You can write your code in this editor


var _array_struct = ren_array();
switch truth(menu){
	case 1:{
		if (instance_exists(a_Player_GUI)) {
			if truth(_array_struct.returned_nav_array)=0{
				instance_destroy(a_Player_GUI)
				menu_change(0)
			}
		}
	}break
	case 3: case 4: case 5: case 6: case 7 :{
		switch truth(_array_struct.returned_nav_array){
			case 0:
			instance_destroy(a_Player_GUI)
			instance_destroy(obj_gui_sprite)
			menu_change(0);break
		}
	}break
	case 8: case 9: {
		var _r=truth(_array_struct.returned_nav_array)
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
