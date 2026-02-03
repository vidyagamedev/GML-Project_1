/// @description Insert description here
// You can write your code in this editor
guicheck=false
upp=true
Bsndwalk=false;
Intimgindx=0;

_move_x = 0
_move_y = 0

dudes = array_length(global.characters)
var _varynames=["spAttack","spJump2","sprIdle","spJump","sprWalk","HspAttack",
"jumpframe","jumpspeed","walkstep2","jumpframe0","LandY","fllspd","myd"]





nbCr=function(){
var NBAttackH = sprite_add("duude/npc/NightBorne/NBAttackH.png" ,12, false, false, 40, 40);///NOW THAT WE HAVE PNG FILE. WE ADD SPRITE. NEW SPRITE NEEDS CONFIGURATIONS!!
sprite_collision_mask(NBAttackH, true, 1, 0, 0, 0, 0, 0, 0);
sprite_set_speed(NBAttackH, 10, spritespeed_framespersecond)

var NBAttack = sprite_add("duude/npc/NightBorne/NBAttack.png" ,12, false, false, 40, 40);///NOW THAT WE HAVE PNG FILE. WE ADD SPRITE. NEW SPRITE NEEDS CONFIGURATIONS!!
sprite_collision_mask(NBAttack, true, 1, 0, 0, 0, 0, 0, 0);
sprite_set_speed(NBAttack, 10, spritespeed_framespersecond)

var NBIdle = sprite_add("duude/npc/NightBorne/NBIdle.png" ,9, false, false, 40, 40);///NOW THAT WE HAVE PNG FILE. WE ADD SPRITE. NEW SPRITE NEEDS CONFIGURATIONS!!
sprite_collision_mask(NBIdle, true, 1, 0, 0, 0, 0, 0, 0);
sprite_set_speed(NBIdle, 11, spritespeed_framespersecond)

var NBRun = sprite_add("duude/npc/NightBorne/NBRun.png" ,6, false, false, 40, 40);///NOW THAT WE HAVE PNG FILE. WE ADD SPRITE. NEW SPRITE NEEDS CONFIGURATIONS!!
sprite_collision_mask(NBRun, true, 1, 0, 0, 0, 0, 0, 0);
sprite_set_speed(NBRun, 7, spritespeed_framespersecond)

sprIdle=NBIdle;
	sprWalk=NBRun;
	spJump=false
	spJump2=false;
	spAttack=NBAttack;
	jumpframe=2;
	jumpspeed=3;
	walkstep2=3;
	jumpframe0=4;
	LandY=-21.75;
	HspAttack=NBAttackH
	fllspd=0
	myd=1
}

ewCr=function(){
			var EWAttack = sprite_add("duude/file/Evil Wizard/EWAttack.png" ,8, false, false, 125, 125);
			sprite_collision_mask(EWAttack, true, 1, 0, 0, 0, 0, 0, 0);
			sprite_set_speed(EWAttack, 12, spritespeed_framespersecond)

			var EWAttackH = sprite_add("duude/file/Evil Wizard/EWAttackH.png" ,8, false, false, 125, 125);
			sprite_collision_mask(EWAttackH, true, 1, 0, 0, 0, 0, 0, 0);
			sprite_set_speed(EWAttackH, 12, spritespeed_framespersecond)

			var EWFall = sprite_add("duude/file/Evil Wizard/EWFall.png" ,2, false, false, 125, 125);
			sprite_collision_mask(EWFall, true, 1, 0, 0, 0, 0, 0, 0);
			sprite_set_speed(EWFall, 7, spritespeed_framespersecond)

			var EWIdle = sprite_add("duude/file/Evil Wizard/EWIdle.png" ,8, false, false, 125, 125);
			sprite_collision_mask(EWIdle, true, 1, 0, 0, 0, 0, 0, 0);
			sprite_set_speed(EWIdle, 11, spritespeed_framespersecond)

			var EWJump = sprite_add("duude/file/Evil Wizard/EWJump.png" ,4, false, false, 125, 125);
			sprite_collision_mask(EWJump, true, 1, 0, 0, 0, 0, 0, 0);
			sprite_set_speed(EWJump, 8, spritespeed_framespersecond)

			var EWRun = sprite_add("duude/file/Evil Wizard/EWRun.png" ,8, false, false, 125, 125);
			sprite_collision_mask(EWRun, true, 1, 0, 0, 0, 0, 0, 0);
			sprite_set_speed(EWRun, 10, spritespeed_framespersecond)

	sprIdle=EWIdle
	sprWalk=EWRun;
	spJump=EWJump;
	spJump2=EWFall;
	spAttack=EWAttack;
	jumpframe=0;
	jumpspeed=2.5;
	walkstep2=5;
	jumpframe0=2;
	LandY=-19.75;
	HspAttack=EWAttackH
	fllspd=-0
	myd=2
}





function pCr(){
var PIdle = sprite_add("duude/npc/Mushroom/PIdle.png" ,3, false, false, 75, 75);///NOW THAT WE HAVE PNG FILE. WE ADD SPRITE. NEW SPRITE NEEDS CONFIGURATIONS!!
sprite_collision_mask(PIdle, true, 1, 0, 0, 0, 0, 0, 0);
sprite_set_speed(PIdle, 4, spritespeed_framespersecond)

var PIdle74 = sprite_add("duude/npc/Mushroom/PIdle74.png" ,8, false, false, 75, 75);///NOW THAT WE HAVE PNG FILE. WE ADD SPRITE. NEW SPRITE NEEDS CONFIGURATIONS!!
sprite_collision_mask(PIdle74, true, 1, 0, 0, 0, 0, 0, 0);
sprite_set_speed(PIdle74, 9, spritespeed_framespersecond)

var PIdleH = sprite_add("duude/npc/Mushroom/PIdleH.png" ,8, false, false, 75, 75);///NOW THAT WE HAVE PNG FILE. WE ADD SPRITE. NEW SPRITE NEEDS CONFIGURATIONS!!
sprite_collision_mask(PIdleH, true, 1, 0, 0, 0, 0, 0, 0);
sprite_set_speed(PIdleH, 9, spritespeed_framespersecond)

var PMove = sprite_add("duude/npc/Mushroom/PMove.png" ,7, false, false, 75, 75);///NOW THAT WE HAVE PNG FILE. WE ADD SPRITE. NEW SPRITE NEEDS CONFIGURATIONS!!
sprite_collision_mask(PMove, true, 1, 0, 0, 0, 0, 0, 0);
sprite_set_speed(PMove, 7, spritespeed_framespersecond)

sprIdle=PIdle
	sprWalk=PMove;
	spJump=false;
	spJump2=false;
	spAttack=PIdle74;
	jumpframe=1;
	jumpspeed=2
	walkstep2=12;
	jumpframe0=4;
	LandY=-19.75;
	HspAttack=PIdleH
	fllspd=-0
	myd=4.5
}


if bodyid >= 1 && bodyid <= dudes{
	var _i =0
	repeat(6){
		variable_instance_set(id, _varynames[_i], global.characters[bodyid-1][_i+1][0]);
		_i +=1
	}
	repeat(7){
		variable_instance_set(id, _varynames[_i], global.characters[bodyid-1][_i+1]);
		_i +=1
	}
	global.characters[bodyid-1][0][1]=true
}


else if bodyid == -1 then {ewCr();}
	//global.idbody.ew += 1}
else if bodyid == -2 then {nbCr();}
	//global.idbody.nb += 1}
else if bodyid == -3 then {pCr()}
else if bodyid == -4 then {BACr()};

gethit = function(){
	if object_get_name(object_index)== "NPCa" ||object_get_name(object_index)==  "a_Player" {
		hp += -1;
		if(hp == 0){
			instance_destroy();
			effect_create_above(0, x + 0, y + 0, 0, $FFFFFF & $ffffff);
			global.characters[bodyid-1][0][1]=false
			if bodyid == -1 then {global.idbody.ew -= 1}
			else if bodyid == -2 then {global.idbody.nb -= 1};
		}
	}
}
