// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Script1(){

}

#region file explorer function!
/// @description	this function returns an array with file/folder names
/// 
/// returns array_push(_files, _file_name)(runtime function)
///
/// ..
/// @function		folder_finder(_directory,_fle=fa_directory)
#endregion
folder_finder =function(_directory,_fle=fa_directory){
	var _files = [];var _file_name=file_find_first(_directory+"*",_fle)
	while (_file_name !=""){
		if(directory_exists(_directory+_file_name)||_fle=fa_none){
			array_push(_files, _file_name)}
		_file_name = file_find_next()}
	file_find_close();return _files}



full_import=function(_directory){
	//var _directory	= working_directory+"duude/file/"
	 //var _INCLUDEDFILES="duude/file/" 		//	"actors/"
	spradding=function(_actor,_postn,_directory,_i,__i){///////function to do all the image file importing... 	return spr
		var _spi = ["file name","number of frames","centre point, x","centre point, y","frames per second"]
		var sprstr=ini_read_string(_postn, _spi[0], "");				

		var sprf=ini_read_real(_postn, _spi[1], 1 );
		var sprx=ini_read_real(_postn, _spi[2], 0);
		var spry=ini_read_real(_postn, _spi[3], 0);
		var sprfps=ini_read_real(_postn, _spi[4], 5 );

		var spr = sprite_add(_directory +_actor +"/"+ sprstr +".png" ,sprf, false, false, 0, 0);///NOW THAT WE HAVE PNG FILE. WE ADD SPRITE. NEW SPRITE NEEDS CONFIGURATIONS!!
		sprite_collision_mask(spr, true, 1, 0, 0, 0, 0, 0, 0);
		sprite_set_offset(spr, sprx, spry);
		sprite_set_speed(spr, sprfps, spritespeed_framespersecond)
		filez[_i][__i+1][1]=sprstr
		return spr
	}
	epicimport=function(_directory){
		var _animationtype=["attacking","falling","standing","jumping","moving","attack hitbox"]
		var _parametertype=["jumpframe","jumpspeed","walkstep2","jumpframe0","LandY","fllspd","myd"]
		var __header="other parameters"
		 var _i = 0;
		repeat (array_length(filez)){
			var _actorzz = filez[_i][0][0]
			ini_open(_directory + _actorzz +"/"+_actorzz +".ini");
			 var __i = 0;
			repeat (array_length(_animationtype)){
				var _epicspr=spradding(_actorzz ,_animationtype[__i],_directory,_i,__i)
				filez[_i][__i+1][0]=_epicspr
				filez[_i][__i+1][2]=array_create(5,false);
			    __i += 1;}
			var _p = 0;
			repeat (array_length(_parametertype)){
				filez[_i][7+_p]= ini_read_real(__header, _parametertype[_p], 1 );
				_p += 1
			}
			ini_close();
		    _i += 1;
		}
	}
	var _filesz=folder_finder(_directory)
	//filez=array_create(array_length(files))
	filez=[]
	var _i =0
	var __i=0
	repeat( array_length(_filesz) ){
		filez[_i]=array_create(7)
		__i=0
		repeat(7){
			filez[_i][__i]=array_create(1)
			__i+=1
		}
		filez[_i][0][0]=_filesz[_i]
		filez[_i][0][1]=false
		_i+=1
	}
	epicimport(_directory)
	return filez
}

