/// @description Insert description here
// You can write your code in this editor
var _returned_array			= auto_array_loop(button_click_array,button_click_check,true)
switch truth(_returned_array){
		case 0: {
			instance_create_layer(-100, 500, "Instances_staging", spawn)
			instance_destroy()
		}break
		case 1:{
		}break
		case 2:{
		}break
		case 3:{
		}break
	}