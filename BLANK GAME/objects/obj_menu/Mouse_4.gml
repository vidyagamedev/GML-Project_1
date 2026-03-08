/// @description Insert description here
// You can write your code in this editor
var _returned_array			= auto_array_loop(button_click_array,button_click_check,true)
var _returned_sub_array		= auto_array_loop(sub_button_array,button_click_check,true)
var _returned_extra_array	= auto_array_loop(extra_button_array,button_click_check,true)
switch truth(menu){
	//0
	case 0:{
		switch truth(_returned_array){
			case 0:{
				instance_create_layer(-100, 500, "Instances_staging", spawn)
				instance_destroy()
			}break
			case 1:{
				//menu1_page=1
				menu_change(1)
			}break
			case 2:{
				menu_change(2)
			}break
		}
	}break
 	case 1:{
		if !(instance_exists(a_Player_GUI)){
			switch truth(_returned_array){case 0:menu_change(0)break}
			if truth(_returned_sub_array)>=0{
				var _spawn =truth(_returned_sub_array)+1
				instance_create_layer(300, 236,"Instances",a_Player_GUI,{bodyid: _spawn,
					sprite_index: global.characters[_spawn-1][2][0]})
				menu_script()
				selected_char=_spawn
			}
			if truth(_returned_extra_array)>=0{
				//menu1_page=page_buttons(_returned_extra_array,menu1_page)
				//menu_script()}
			}
		}
		else{
			switch truth(_returned_array){
				case 0:{instance_destroy(a_Player_GUI)
					menu_script()}}
			if truth(_returned_sub_array)>=0{menu_change(8)}
			//if truth(_returned_extra_array)>=0{menu_change(0)}	see global click event
		}
	}break
	case 8:{
		switch truth(_returned_array){
			case 0:{
				instance_destroy(obj_gui_sprite)
				if !(instance_exists(a_Player_GUI)){
				instance_create_layer(300, 236,"Instances",a_Player_GUI,{
					sprite_index: global.characters[selected_char-1][2][0],
					bodyid: selected_char})
				}
				menu_change(1)
			}break
		}
		var _select =truth(_returned_sub_array)
		if _select >=0&&_select <6{
			selected_action=_select
			page_9=1
			menu_change(9)
			instance_destroy(a_Player_GUI); instance_destroy(obj_gui_sprite)
			instance_create_layer(300,277,"Instances",obj_gui_sprite,{
				sprite_index: global.characters[selected_char-1][selected_action+1][0]})
		}
	}break
	case 9:{
		switch truth(_returned_array){
			case 0:{
				menu_change(8)
			}break
		}
		if truth(_returned_sub_array)>=0{page_9=page_buttons(_returned_sub_array,page_9)
			menu_script()}
	}break

	case 2:{
		switch truth(_returned_array){
			case 0:{
				//menu_code=1
				//menu=[];menu_script()
				menu_change(3)
			}break
			case 1:{
				menu_code=2
				menu=[];menu_script()
			}break
			case 2:{
				menu_code=0
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
		if truth(_returned_sub_array)>=0{
			var _select =truth(_returned_sub_array) +1
			global.selection[_select]=!(global.selection[_select])
			menu_script()
		}
		if truth(_returned_extra_array)>=0{
			//menu4_page=page_buttons(_returned_extra_array,menu4_page)
		}
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
						selected_action=-1
						instance_destroy(obj_gui_sprite)
					menu_script()
				}
				else{
					instance_destroy(a_Player_GUI)
					menu_script()
				}
			}break
			case 1:{
				menu_change(5)
				selected_action=-1
				instance_destroy(obj_gui_sprite)
			}break
		}
		var _select =truth(_returned_sub_array)
		if _select >=0&&_select <6{
			selected_action=_select
			show_debug_message(selected_action)
			menu_change(7)
			//current_sprite=global.characters[selected_char][selected_action+1][0]
			//giant_array_for_character[_posit][5]
			//sprite_set_speed(sprite_index, _sprfps, spritespeed_framespersecond);
			//	draw_sprite(global.characters[selected_char][selected_action+1][0],image_index,300,277)
			instance_destroy(obj_gui_sprite)
			instance_create_layer(300,277,"Instances",obj_gui_sprite,
			{sprite_index: global.characters[selected_char][selected_action+1][0]})

		}
	}break
	case 7:{
		switch truth(_returned_array){
			case 0:{
				
			}break
			case 1:{
				
			}break
			case 2:{
				menu_change(6)
			}break
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
//show_debug_message(_returned_sub_array)
//show_debug_message(global.selection)
