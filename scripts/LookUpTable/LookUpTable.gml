// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.lookUpTable = {
		IronSword: new Equipment(itemCat.equipment, equipmentTypes.weapon, "Iron Sword", "It's an Iron Sword", 
		function(){oCharacterData.increaseDamage(5);},
		function(){oCharacterData.increaseDamage(-5);},
		5, 3,setType.iron, sprSword),
		
		CopperSword: new Equipment(itemCat.equipment, equipmentTypes.weapon, "Copper Sword", "It's an Iron Sword", 
		function(){oCharacterData.increaseDamage(5);},
		function(){oCharacterData.increaseDamage(-5);},
		5, 3,setType.iron, sprCSword),
		
		IronHelm: new Equipment(itemCat.equipment, equipmentTypes.head, "Iron Helm", "It's an Iron Helm", 
		//TODO - remember to make sure to change this into a setter at some point
		function(){oCharacterData.characterData.maxShields += 5;},
		function(){oCharacterData.characterData.maxShields -= 5;},
		5, 3,setType.iron, sprHelm),
		
		CopperHelm: new Equipment(itemCat.equipment, equipmentTypes.head, "Copper Helm", "It's an Iron Helm", 
		function(){oCharacterData.characterData.maxShields += 5;},
		function(){oCharacterData.characterData.maxShields -= 5;},
		5, 3,setType.iron, sprCHelm),
		
		HealthPotion: new  Consumable(itemCat.consumable, "Health Potion", "This is a health potion",
		function(){return oCharacterData.heal(5);},
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
	lvlUpCost = [400, 600, 1000, 1200];
	level = 1;
	maxLevel = array_length(lvlUpCost) + 1;
	isEquipped = false;
	levelUp = function(){
		if(level == maxLevel){
			exit;
		}
		if(isEquipped){
			lookUp.onDequip(level);
			level ++;
			lookUp.onEquip(level);
		} else {level ++;}
	}
	
}

function ConsumableItem (_consumable) constructor {
	lookUp = _consumable;
}


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
