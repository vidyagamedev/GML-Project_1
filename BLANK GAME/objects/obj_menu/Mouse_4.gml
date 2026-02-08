/// @description Insert description here
// You can write your code in this editor
var _returned_array			= auto_array_loop(button_click_array,button_click_check,true)
var _returned_sub_array		= auto_array_loop(sub_button_array,button_click_check,true)
var _returned_extra_array	= auto_array_loop(extra_button_array,button_click_check,true)
switch truth(menu){
	case 0:{
		switch truth(_returned_array){
			case 0:{
				instance_create_layer(-100, 500, "Instances_staging", spawn)
				instance_destroy()
			}break
			case 1:{
				menu1_page=1
				menu_change(1)
			}break
			case 2:{
				menu_change(2)
			}break
		}
	}break
	case 1:{
		switch truth(_returned_array){
			case 0:{
				if instance_exists(a_Player_GUI){instance_destroy(a_Player_GUI)}
				else menu_change(0)
			}break
		}
		menu1_page=page_buttons(_returned_extra_array,menu1_page)
		var _spawn =truth(_returned_sub_array)+1
		if _spawn>0{instance_create_layer(300, 236,"Instances",a_Player_GUI,{
			sprite_index: global.characters[_spawn-1][2][0],
			bodyid: _spawn})}
		menu_script()
	}break
	case 2:{
		switch truth(_returned_array){
			case 0:{
				menu_change(3)
			}break
			case 1:{
				menu=[];menu_script()
			}break
			case 2:{
				menu=[];menu_script()
			}break
			case 3:{
				menu_change(0)
			}break
		}
	}break
	case 3:{
		switch truth(_returned_array){
			case 0:{
				menu4_page=1
				menu_change(4)
			}break
			case 1:{
				menu5_page=1
				menu_change(5)
			}break
			case 2:{
			}break
			case 3:{
				menu_change(2)
			}break
		}
	}break
	case 4:{
		switch truth(_returned_array){
			case 0:{
				menu_change(3)
			}break
		}
		menu4_page=page_buttons(_returned_extra_array,menu4_page)
		var _select =truth(_returned_sub_array)
		global.selection[_select+1]=!(global.selection[_select+1])
		menu_script()
	}break
	case 5:{
		switch truth(_returned_array){
			case 0:{
				menu_change(3)
			}break
		}
		var _select =truth(_returned_sub_array)
		if _select >=0{
			selected_char=_select
			menu_change(6)
		}
	}break
	case 6:{
		switch truth(_returned_array){
			case 0:{
				if !(instance_exists(a_Player_GUI)){
					instance_create_layer(269, 236,"Instances",a_Player_GUI,{
						sprite_index: global.characters[selected_char][2][0],
						bodyid: selected_char+1})
					menu_script()
				}
				else{
					instance_destroy(a_Player_GUI)
					menu_script()
				}
			}break
			case 1:{
				menu_change(5)
			}break
		}
		var _select =truth(_returned_sub_array)
		if _select >=0{
			selected_action=_select
			//menu_change(6)
		}
	}break

	case -1:{
		switch truth(_returned_array){
			case 0:{
				menu_change(2)
			}break
		}
	}break
	case 9000:{
		switch truth(_returned_array){
			case 0:{
			}break
			case 1:{
			}break
			case 2:{
			}break
		}
	}break
}
show_debug_message(_returned_sub_array)
show_debug_message(global.selection)
