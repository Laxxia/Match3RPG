/// @description Insert description here
// You can write your code in this editor
if(global.pause){exit;}
switch(state){
	case enemyState.walking:
		enemyMove();
	break;
	case enemyState.attacking:
		alarm[0] = room_speed*attackSpeed;
	break;
}

if(animateOnce){
	if(animationEndCheck()){
		if(oCharacterData.getTarget() != noone){
			enemyStateChange(enemyState.idle, spriteArray[enemyState.idle], false);
		}
	}
}