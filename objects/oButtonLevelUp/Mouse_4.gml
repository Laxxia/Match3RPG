/// @description Insert description here
// You can write your code in this editor

if(oCharacterData.getCurXP() >= item.lvlUpCost[item.level - 1]){
	oCharacterData.gainExperience(-item.lvlUpCost[item.level - 1]);
	item.levelUp();
}