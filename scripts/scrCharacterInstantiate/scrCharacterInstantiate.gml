// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrCharacterInstantiate(){
	ds_grid_destroy(global.characterData.itemInventory);
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
		spellXP : 0,
		itemInventory : ds_grid_create(3,8)

	}
	ds_grid_clear(global.characterData.itemInventory, -1);
}