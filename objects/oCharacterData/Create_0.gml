/// @description Insert description here
// You can write your code in this editor
characterData = {
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
	curLuck : 0,
	attackDmg : 5
	
	//currentAttackDmgLower : 3,
	//currentAttackDmgUpper : 5
	
}
#region //Getters
function getMaxHP(){
	return characterData.maxHP;
}

function getCurHP(){
	return characterData.curHP;
}

function getMaxShields(){
	return characterData.maxShields;
}

function getCurShields(){
	return characterData.curShields;
}
function getMaxMana(){
	return characterData.maxMana;
}
function getCurMana(){
	return characterData.curMana;
}
function getCurGold(){
	return characterData.gold;
}
function getCurLuck(){
	return characterData.curLuck;
}

function getChargeValue(){
	return characterData.chargeCount;
}

function getTarget(){
	return characterData.target
}

function getCurXP(){
	return characterData.curXP
}

function getCurAttackDmg(){
	return characterData.attackDmg;
}
#endregion

#region //Setters
 function equip(item){
	item.lookUp.onEquip(item.level);
 }
 
 function unequip(item){
	item.lookUp.onDequip(item.level);     
 }
 
 function gainExperience(value){
	characterData.curXP += value;
 }
 
 function gainShields(value){
	var _cur = characterData.curShields;
	var _max = characterData.maxShields;
	if(_max - _cur < value){characterData.curShields = characterData.maxShields;}
	else {characterData.curShields += value;}
 }
 
 function gainMana(value){
	var _cur = characterData.curMana;
	var _max = characterData.maxMana;
	if(_max - _cur < value){characterData.curMana = characterData.maxMana;}
	else {characterData.curMana += value;}
 }
 
 function gainGold(value){
	characterData.gold += value;
 }
 
 function increaseLuck(value){
	characterData.curLuck += value;
 }
 
 function chargeUp(value){
	characterData.chargeCount += value;
 }
 
 function setTarget(value){
	characterData.target = value;
 }
 
 function heal(healingValue){
	var _curHP = characterData.curHP;
	var _maxHP = characterData.maxHP;
	if(_curHP == _maxHP){return false;}
	if(_curHP + healingValue > _maxHP){
		characterData.curHP = characterData.maxHP;
	} else {characterData.curHP += healingValue;}
	return true;
 }
#endregion