// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrAttackPlayer(attack){
	if(global.characterData.curShields - attack > 0){
		global.characterData.curShields -= attack;
	} else if (global.characterData.curShields > 0){
		var temp = attack - global.characterData.curShields;
		global.characterData.curShields = 0;
		global.characterData.curHP -= temp;
	} else {
		global.characterData.curHP -= attack;
	}
	
}