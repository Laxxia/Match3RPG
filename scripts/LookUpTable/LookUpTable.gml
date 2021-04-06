// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.lookUpTable = {
		IronSword: new Equipment(itemCat.equipment, equipmentTypes.weapon, "Iron Sword", "It's an Iron Sword", 
		function(){oPlayer.attackDamage  += 5;},
		function(){oPlayer.attackDamage -= 5;},
		5, 3,setType.iron, sprSword),
		
		CopperSword: new Equipment(itemCat.equipment, equipmentTypes.weapon, "Copper Sword", "It's an Iron Sword", 
		function(){oPlayer.attackDamage  += 5;},
		function(){oPlayer.attackDamage -= 5;},
		5, 3,setType.iron, sprCSword),
		
		IronHelm: new Equipment(itemCat.equipment, equipmentTypes.head, "Iron Helm", "It's an Iron Helm", 
		function(){oPlayer.defense += 5;},
		function(){oPlayer.defense -= 5;},
		5, 3,setType.iron, sprHelm),
		
		CopperHelm: new Equipment(itemCat.equipment, equipmentTypes.head, "Copper Helm", "It's an Iron Helm", 
		function(){oPlayer.defense += 5;},
		function(){oPlayer.defense -= 5;},
		5, 3,setType.iron, sprCHelm),
		
		HealthPotion: new  Consumable(itemCat.consumable, "Health Potion", "This is a health potion",
		function(){oPlayer.curHP += 5;},
		5, sprUiHealthPotion)
}

function Equipment (itemType,equipmentType,itemName,description,onEquip,onDequip,cost,maxLevel,set, sprite) constructor{
  self.itemType = itemType
  self.equipmentType = equipmentType
  self.itemName =  itemName
  self.description = description  
  self.onEquip = onEquip
  self.onDequip = onDequip
  self.cost = cost
  self.maxLevel = maxLevel
  self.set = set
  self.sprite = sprite //probably group them, so all swords are one sprite, and then have the sprite_index be the specific sword
}

function Consumable (itemType,itemName,description,onConsume,cost,sprite) constructor{
  self.itemType = itemType
  self.itemName =  itemName
  self.description = description  
  self.onConsume = onConsume
  self.cost = cost
  self.sprite = sprite
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

function PlayerGearHolder(_body, _item/*, _x, _y */) constructor {
   bodyType = _body;
   item = _item;
   //inventory_x = _x;
   //inventory_y = _y;
}

function Gear(_helmet, _chest, _gloves, _boots, _legs, _weapon, _shield, _amuletOne, _amuletTwo) constructor {
  helmet = _helmet;
  chest = _chest;
  gloves = _gloves;
  boots = _boots;
  legs = _legs;
  weapon = _weapon;
  shield = _shield;
  amuletOne = _amuletOne;
  amuletTwo = _amuletTwo;
  allItems = [helmet, chest, gloves, boots, legs, weapon, shield, amuletOne, amuletTwo];
}

global.playerGear = new Gear(
    new PlayerGearHolder(equipmentTypes.head, -1),
    new PlayerGearHolder(equipmentTypes.chest, -1),
    new PlayerGearHolder(equipmentTypes.gloves, -1),
    new PlayerGearHolder(equipmentTypes.boots, -1),
    new PlayerGearHolder(equipmentTypes.legs, -1),
    new PlayerGearHolder(equipmentTypes.weapon, -1),
    new PlayerGearHolder(equipmentTypes.shield, -1),
    new PlayerGearHolder(equipmentTypes.amulet, -1),
    new PlayerGearHolder(equipmentTypes.amulet, -1)
);

enum equipmentTypes{
	head,
	chest,
	gloves,
	boots,
	legs,
	weapon,
	shield,
	amulet
}

enum itemCat{
	material,
	consumable,
	equipment
}

function scrEquip(equipItem, xx, yy){
	var pg = global.playerGear;
	for(var i = 0; i < array_length(pg.allItems); i++){
		var item = pg.allItems[i];
		if(item.bodyType == equipItem.lookUp.equipmentType){
			isFilled(item.item, xx, yy);
			item.item = equipItem;
			break;
		}
	}
}

function isFilled(slot, xx, yy){
	if(slot == -1){
		oPlayerInventory.ds_inventory[# yy, xx] = -1;
	} else {oPlayerInventory.ds_inventory[# yy, xx] = slot;}
	
}