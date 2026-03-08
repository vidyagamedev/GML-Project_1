/// @description Insert description here
// You can write your code in this editor
menu_functions()	//preparing scripts
draw_set_font (fnt_button)
draw_set_valign(fa_middle)

ecks=x

//menu=[];menu[0]=true
nav=false
//menu_script()
menu_change(0)
global.characters = full_import(working_directory+"duude/file/")
if !(variable_global_exists("selection")) then global.selection[array_length(global.characters)]=false
selected_action=-1
edit[0]=false
menu_code=0
