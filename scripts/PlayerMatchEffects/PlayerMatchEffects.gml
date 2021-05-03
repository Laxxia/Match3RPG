// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrPlayerAttack(matchCount, special){
	if(oCharacterData.getTarget() != noone){
		matchCount -= 2;
		var damage = oCharacterData.getCurAttackDmg();
		//For the bonuses to abilities, what we want to do, 
		//Is to pull the attack value from the player information
		//as that will change based on character info
		//And then pass the rest of the variables after declaring them 
		//in if statements probably
		if(special){damage += 2;}
		damage = (damage * matchCount);
		oCharacterData.dealDamage(damage);
	} else {exit;}
}

function scrPlayerLuck(matchCount, special){
	oCharacterData.increaseLuck(irandom(6));
}

function scrPlayerShields(matchCount, special){
		matchCount -= 2;
		var shields = 1;
		if(special){shields ++;}
		shields = (shields * matchCount);
		
		if(oCharacterData.getCurShields() + shields <= oCharacterData.getMaxShields()){
			oCharacterData.gainShields(shields);
		} else {
			oCharacterData.gainShields(oCharacterData.getMaxShields() - oCharacterData.getCurShields());
		}
}

function scrPlayerGold(matchCount, special){
		matchCount -= 2;
		var gold = 1;
		if(special){gold ++;}
		gold = (gold * matchCount);
		oCharacterData.gainGold(gold);
}