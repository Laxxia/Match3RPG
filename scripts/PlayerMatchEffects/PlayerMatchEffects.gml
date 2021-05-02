// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrPlayerAttack(matchCount, special){
	if(global.characterData.target != noone){
		matchCount -= 2;
		damage = global.characterData.attackDmg;
		//For the bonuses to abilities, what we want to do, 
		//Is to pull the attack value from the player information
		//as that will change based on character info
		//And then pass the rest of the variables after declaring them 
		//in if statements probably
		if(special){damage += 2;}
		global.characterData.target.curHP -= (damage * matchCount);	
	} else {exit;}
}

function scrPlayerLuck(matchCount, special){
	global.characterData.curLuck += irandom(6);
}

function scrPlayerShields(matchCount, special){
		matchCount -= 2;
		var shields = 1;
		if(special){shields ++;}
		shields = (shields * matchCount);
		
		if(global.characterData.curShields + shields <= global.characterData.maxShields){
			global.characterData.curShields += shields;
		} else {
			global.characterData.curShields += global.characterData.maxShields - global.characterData.curShields;
		}
}

function scrPlayerGold(matchCount, special){
		matchCount -= 2;
		var gold = 1;
		if(special){gold ++;}
		gold = (gold * matchCount);
		global.characterData.gold += gold;
}