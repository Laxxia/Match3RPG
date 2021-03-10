// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.lookUpTable = {
		IronSword: new Equipment(equipmentTypes.weapon, "Iron Sword", "It's an Iron Sword", 
		function(){oPlayer.attackDamage  += 5;},
		function(){oPlayer.attackDamage -= 5;},
		5, 3,setType.iron, sprSword),
		
		CopperSword: new Equipment(equipmentTypes.weapon, "Copper Sword", "It's an Iron Sword", 
		function(){oPlayer.attackDamage  += 5;},
		function(){oPlayer.attackDamage -= 5;},
		5, 3,setType.iron, sprCSword),
		
		IronHelm: new Equipment(equipmentTypes.head, "Iron Helm", "It's an Iron Helm", 
		function(){oPlayer.defense += 5;},
		function(){oPlayer.defense -= 5;},
		5, 3,setType.iron, sprHelm),
		
		CopperHelm: new Equipment(equipmentTypes.head, "Copper Helm", "It's an Iron Helm", 
		function(){oPlayer.defense += 5;},
		function(){oPlayer.defense -= 5;},
		5, 3,setType.iron, sprCHelm)
}

function Equipment (itemType,itemName,description,onEquip,onDequip,cost,maxLevel,set, sprite) constructor{
  self.itemType = itemType
  self.itemName =  itemName
  self.description = description  
  self.onEquip = onEquip
  self.onDequip = onDequip
  self.cost = cost
  self.maxLevel = maxLevel
  self.set = set
  self.sprite = sprite //probably group them, so all swords are one sprite, and then have the sprite_index be the specific sword
}


function equipableGear (gearPiece) constructor {
	lookUp = gearPiece;
	mapXP = 400;
	xp = 0;
	level = 0;
}

function scrInventoryAdd(itemData){
	var grid = global.characterData.itemInventory;

	for(var i = 0; i < 	ds_grid_width(grid); i++){
		for (var j = 0; j < ds_grid_height(grid); j++){
			if (grid[# i, j] == -1){
				grid[# i, j] = new equipableGear(itemData);
				exit;
			}
		}
	}
}

global.playerGear = {
	helmet:			-1,
	chest:			-1,
	gloves:			-1,
	boots:			-1,
	legs:			-1,
	weapon:			-1,
	shield:			-1,
	amuletOne:		-1,
	amuletTwo:		-1,
	amuletThree:	-1,
	amuletFour:		-1
}

function scrEquip(equipItem, xx, yy){
	var pg = global.playerGear;
	switch(equipItem.lookUp.itemType){
		case equipmentTypes.head:
			if(isFilled(pg.helmet)){
				 oPlayerInventory.ds_inventory[# yy, xx] = pg.helmet;
			} else {oPlayerInventory.ds_inventory[# yy, xx] = -1;}
			pg.helmet = equipItem;
		break;
		case equipmentTypes.weapon:
			if(isFilled(pg.weapon)){
				 oPlayerInventory.ds_inventory[# yy, xx] = pg.weapon;
			} else {oPlayerInventory.ds_inventory[# yy, xx] = -1;}
			pg.weapon = equipItem;
		break;
	}
}

function isFilled(slot){
	if(slot == -1){
		return false;
	} else {return true;}
	
}