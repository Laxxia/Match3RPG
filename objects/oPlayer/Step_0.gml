/// @description Insert description here
// You can write your code in this editor

//This is for animation stuff probably
//if(state = "Attack"){
//	alarm[0] = room_speed*2;
//	state = "Attacking";
//}


//Debugging stuff and force summoning enemies
if(keyboard_check_pressed(ord("P"))){
	room_goto(shop);
}

if(global.characterData.curHP <= 0){
	scr_restart_level()
}