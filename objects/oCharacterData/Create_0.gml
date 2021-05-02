/// @description Insert description here
// You can write your code in this editor
global.characterData = {
	maxHP : 10,
	curHP : 10,
	maxMana : 100,
	curMana : 0,
	gold : 0,
	chargeCount : 0,
	target : noone,
	maxShields : 10,
	curShields : 0,
	curXP : 0,
	spellXP : 0
	
}

 function equip(item){
	item.lookUp.onEquip(item.level);
 }
 
 function unequip(item){
	item.lookUp.onDequip(item.level);     
 }
