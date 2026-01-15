// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function unused(){

}


if false{



//global check does what?
//it's from a_player code, every frame/step
//if _up||sprite_index=spJump||sprite_index=spJump2
//{
//	global.chkk1=true
//}
//else global.chkk1=false
if global.chkk1=true{chck1=true}else chck1=false





if instance_exists(a_Player)&&spawn.enemycheck>=0{
	//what is atak	?	IF ENEMY DETECTED IN RECTANGLE, THEN ATTACK. 
	//					then atak equals true
	//so when this ally npc is NOT attacking, do this:
	if !atak{
		if ( collision_rectangle(x + -200, y + -200, x + 500, y + 200, NPCe, true, 1) ) !=noone
		{
			//if enemy detected nearby then...
				//find and attack enemy
				//as un RUN TOWARDS THEM
			direction = point_direction(x, y, NPCe.x, NPCe.y);
				//remember, if direction isn't up, then move in direction
				//technically, if direction is straight up or down, then don't move
				//DUH. that's how TRUGOMETRY WORKS. ficking cosine laws DURRr
		}
		else if !chck1
		//////////////////////////
		{//move to position beside player
			if collision_rectangle(x-5 +myd*15-10, y + -200, x-5+myd*15-2, y + 200, a_Player, true, 1) =noone
			{
				direction = point_direction(x, y, a_Player.x+5-myd*15, a_Player.y)
			}
			else direction=90
		}
	}
	else //if atak. walk back to player
	{
		direction = point_direction(x, y, a_Player.x, a_Player.y)
		if ( collision_rectangle(x + -20, y + -20, x + 20, y + 20, a_Player, true, 1) ) !=noone {
			atak=false
		}
	}
}













//IF ENEMY DETECTED IN RECTANGLE, THEN ATTACK. 
if ( collision_rectangle(x + -20, y + -20, x + 20, y + 20, NPCe, true, 1) ) !=noone {_space = true
	atak=true;
	direction = point_direction(x, y, NPCe.x, NPCe.y);
	}
else {_space = false}









if cos(degtorad(direction)) >0.1
{
	_right=true;
	_move_x=1;
	_left=false;
}
else if cos(degtorad(direction)) <-0.1
{
	_left=true;
	_move_x=-1
	_right=false;
}
else{_left=false;
	_right=false;}

// Inherit the parent event
event_inherited();
//}


























//Wtf
if false{}

/// @description Insert description here
// You can write your code in this editor

//global check is true if player character is (in the middle of) jumping
if global.chkk1=true{chck1=true}else chck1=false

//if player exists and there are enemies
if instance_exists(a_Player)&&spawn.enemycheck>=0{
	//if NOT (in behaviour) attacking
	if !atak{
		//if enemy detected nearby then...
		if ( collision_rectangle(x + -200, y + -200, x + 500, y + 200, NPCe, true, 1) ) !=noone
		{
			//find and attack enemy, as in RUN TOWARDS THEM
			direction = point_direction(x, y, NPCe.x, NPCe.y);
		}
		else if !chck1
		//if there are no nearby enemies AND player character is NOT jumping
		{
			//idk
			//OMF THIS IS to show natural behaviour, stop moving when too close to player
			if collision_rectangle(x-5 +myd*15-10, y + -200, x-5+myd*15-2, y + 200, a_Player, true, 1) =noone
			{
				//move to position beside player
				direction = point_direction(x, y, a_Player.x+5-myd*15, a_Player.y)
			}
			//
			else direction=90
		}
	}
	else //if atak. walk back to player
	{
		direction = point_direction(x, y, a_Player.x, a_Player.y)
		if ( collision_rectangle(x + -20, y + -20, x + 20, y + 20, a_Player, true, 1) ) !=noone {
			atak=false
		}
	}
}













//IF ENEMY DETECTED IN RECTANGLE, THEN ATTACK. 
if ( collision_rectangle(x + -20, y + -20, x + 20, y + 20, NPCe, true, 1) ) !=noone {_space = true
	atak=true;
	direction = point_direction(x, y, NPCe.x, NPCe.y);
	}
else {_space = false}









if cos(degtorad(direction)) >0.1
{
	_right=true;
	_move_x=1;
	_left=false;
}
else if cos(degtorad(direction)) <-0.1
{
	_left=true;
	_move_x=-1
	_right=false;
}
else{_left=false;
	_right=false;}

// Inherit the parent event
event_inherited();
//}








/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
//Wtf
if false{}


if global.chkk1=true{chck1=true}else chck1=false//if player character is jumping or not

if instance_exists(a_Player)&&spawn.enemycheck>=0{
	if !atak{//if NOT in atack behaviour... then {if enemy detected nearby then...}
		if ( collision_rectangle(x + -200, y + -200, x + 500, y + 200, NPCe, true, 1) ) !=noone
		{direction = point_direction(x, y, NPCe.x, NPCe.y);}
		else if !chck1
		{//if there are no nearby enemies AND player character is NOT! jumping, then... if NOT too close to player, then move to player... else, don't move
			if collision_rectangle(x-5 +myd*15-10, y + -200, x-5+myd*15-2, y + 200, a_Player, true, 1) =noone
			{direction = point_direction(x, y, a_Player.x+5-myd*15, a_Player.y)}
			else direction=90
		}
	}
	else {//else.... if atak. walk back to player
		direction = point_direction(x, y, a_Player.x, a_Player.y)
		if ( collision_rectangle(x + -20, y + -20, x + 20, y + 20, a_Player, true, 1) ) !=noone
		{atak=false}
	}
}

if ( collision_rectangle(x + -20, y + -20, x + 20, y + 20, NPCe, true, 1) ) !=noone {//IF ENEMY DETECTED IN RECTANGLE, THEN ATTACK. 
	_space = true
	atak=true;
	direction = point_direction(x, y, NPCe.x, NPCe.y);
}
else {_space = false}

if cos(degtorad(direction)) >0.1{
	_right=true;
	_move_x=1;
	_left=false;
}
else if cos(degtorad(direction)) <-0.1{
	_left=true;
	_move_x=-1
	_right=false;
}
else{_left=false;
	_right=false;}

// Inherit the parent event
event_inherited();
//}






/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
//Wtf

//spawn
//NPCe


}
