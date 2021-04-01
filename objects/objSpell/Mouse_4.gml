/// @description Insert description here
// You can write your code in this editor
if(global.characterData.target == noone || global.pause){exit;}
if(global.characterData.curMana > manaCost){
	global.characterData.target.curHP -= damage;
	global.characterData.curMana -= manaCost;
}
