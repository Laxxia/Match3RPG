// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrMatchAction(matchType, matchCount, special){
	switch(matchType){
		case jewelType.attack:
			scrPlayerAttack(matchCount, special);
		break;
		case jewelType.luck:
			scrPlayerLuck(matchCount, special)
		break;
		case jewelType.shields:
			scrPlayerShields(matchCount, special);
		break;
		case jewelType.bad:
		//bad to be determined
		break;
		case jewelType.gold:
			scrPlayerGold(matchCount, special);
		break;
		case jewelType.charge: 
			global.characterData.chargeCount ++;
		break;
		case jewelType.mana:
			if(global.characterData.maxMana - global.characterData.curMana < 7){
				global.characterData.curMana += (global.characterData.maxMana - global.characterData.curMana);
			} else {
				global.characterData.curMana += 7;
			}
		break;
	}
}