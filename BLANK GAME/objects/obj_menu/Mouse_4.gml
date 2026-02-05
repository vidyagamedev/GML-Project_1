/// @description Insert description here
// You can write your code in this editor
var _returned_array = auto_array_loop(button_click_array,button_click_check,true)
switch truth(menu){
	case 0:{
		switch truth(_returned_array){
			case 0:{
				instance_create_layer(-100, 500, "Instances_staging", spawn)
				instance_destroy()
			}break
			case 1:{
			}break
			case 2:{
				menu_change(2)
			}break
		}
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
			}break
			case 1:{
			}break
			case 2:{
			}break
			case 3:{
				menu_change(2)
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
