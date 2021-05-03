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
			oCharacterData.chargeUp(matchCount);
		break;
		case jewelType.mana:
			oCharacterData.gainMana(7);
		break;
	}
}