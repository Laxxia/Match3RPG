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


if(keyboard_check_pressed(ord("G"))){
	oCharacterData.gainExperience(1000);
}

if(animateOnce){
	if(animationEndCheck()){
		if(oCharacterData.getTarget() != noone){
			stateChange(playerState.idle, s_charIdle, false);
		} else {stateChange(playerState.walking, s_charWalk, false);}
	}
}