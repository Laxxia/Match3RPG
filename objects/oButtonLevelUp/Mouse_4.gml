/// @description Insert description here
// You can write your code in this editor

if(global.characterData.curXP >= item.lvlUpCost[item.level - 1]){
	global.characterData.curXP -= item.lvlUpCost[item.level - 1];
	item.levelUp();
}