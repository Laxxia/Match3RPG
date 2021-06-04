/// @description Insert description here
// You can write your code in this editor

function characterInstantiate(){
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
		attackDmg : 0,
		baseDmg : 1
	
		//currentAttackDmgLower : 3,
		//currentAttackDmgUpper : 5
	}
	characterData.attackDmg = characterData.baseDmg;
}
characterInstantiate();
#region //Getters
getMaxHP = function(){
	return characterData.maxHP;
}

getCurHP = function(){
	return characterData.curHP;
}

getMaxShields = function(){
	return characterData.maxShields;
}

getCurShields = function(){
	return characterData.curShields;
}
getMaxMana = function(){
	return characterData.maxMana;
}
getCurMana = function(){
	return characterData.curMana;
}
getCurGold = function(){
	return characterData.gold;
}
getCurLuck = function(){
	return characterData.curLuck;
}

getChargeValue = function(){
	return characterData.chargeCount;
}

getTarget = function(){
	return characterData.target;
}

getCurXP = function(){
	return characterData.curXP;
}

getCurAttackDmg = function(){
	return characterData.attackDmg;
}
#endregion

#region //Setters
 function equip(item){
	item.lookUp.onEquip(item.level);
	item.isEquipped = true;
 }
 
 function unequip(item){
	item.lookUp.onDequip(item.level);   
	item.isEquipped = false;
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
 
 function loseShields(value){
	characterData.curShields -= value;
	if(getCurShields() < 0){
		characterData.curShields = 0;
	}
 }
 
 function gainMana(value){
	var _cur = characterData.curMana;
	var _max = characterData.maxMana;
	if(_max - _cur < value){characterData.curMana = characterData.maxMana;}
	else {characterData.curMana += value;}
 }
 
 function spendMana(value){
	var _cur = characterData.curMana;
	if(_cur - value < 0){
		return false;
	} else {
		characterData.curMana -= value;
		return true;
	}
 }
 
 function gainGold(value){
	characterData.gold += value;
 }
 
 function increaseDamage(value){
	characterData.attackDmg += value;
 }
 
 function decreaseDamage(value){
	characterData.attackDmg -=  value;
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
 
 function loseHP(lossValue){
	characterData.curHP -= lossValue;
	if(getCurHP() <= 0){
		scr_restart_level()
	}
 }
 
 function dealDamage(damage){
	var target = oCharacterData.getTarget();
	if(target != noone){
		oPlayer.tempDamage = damage;
		if(characterData.chargeCount > 0){
			oPlayer.tempDamage += (oPlayer.tempDamage * (.15 * characterData.chargeCount));
			characterData.chargeCount = 0;
		}
		if(instance_exists(oPlayer)){
			oPlayer.stateChange(playerState.attacking, s_charAttack, true);
		}
	}
}

function takeDamage(damage){
	if(getCurShields() - damage > 0){
		loseShields(damage);
	} else if (getCurShields() > 0){
		var temp = damage - getCurShields();
		characterData.curShields = 0;
		loseHP(temp);
	} else {
		loseHP(damage);
	}
	takeDamageAnim();
}

function takeDamageAnim(){
	if(instance_exists(oPlayer)){
		if(oPlayer.state != playerState.attacking){
			oPlayer.stateChange(playerState.hurt, s_charHurt, true);
		}
		//Maybe else just blink red? do the same for the enemy?
	}
}

#endregion