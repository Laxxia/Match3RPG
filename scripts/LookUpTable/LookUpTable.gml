/// @description Insert description here
// You can write your code in this editor
global.lookUpTable = {
		
	Stick: new Weapon(itemCat.equipment, equipmentTypes.weapon, "Sturdy Branch", "You found this on the ground", 3,
		function(_self, level){
			oCharacterData.increaseDamage(_self.damage * level);
		},
		function(_self, level){
			oCharacterData.decreaseDamage(_self.damage * level);
		},
	5,-1, sprTwigWeapon),
	
	IronSword: new Weapon(itemCat.equipment, equipmentTypes.weapon, "Iron Sword", "It's an Iron Sword", 10, 
		function(_self, level){
			oCharacterData.increaseDamage(_self.damage * level);
		},
		function(_self, level){
			oCharacterData.decreaseDamage(_self.damage * level);
		},
	5,setType.iron, sprSword),
		
	CopperSword: new Weapon(itemCat.equipment, equipmentTypes.weapon, "Copper Sword", "It's an Iron Sword", 20, 
		function(_self, level){
			oCharacterData.increaseDamage(_self.damage * level);
		},
		function(_self, level){
			oCharacterData.decreaseDamage(_self.damage * level);
		},
	5,setType.iron, sprCSword),
		
	IronHelm: new Equipment(itemCat.equipment, equipmentTypes.head, "Iron Helm", "It's an Iron Helm", 
	//TODO - remember to make sure to change this into a setter at some point
	function(level){
		switch(level){
			case 1:
			oCharacterData.increaseMaxHP(5);
			break;
			case 2:
			oCharacterData.increaseMaxHP(10);
			break;
			case 3:
			oCharacterData.increaseMaxHP(15);
			break;
			case 4:
			oCharacterData.increaseMaxHP(20);
			break;
			case 5:
			oCharacterData.increaseMaxHP(25);
			break;
		}
	},
	function(level){
		switch(level){
			case 1:
			oCharacterData.decreaseMaxHP(5);
			break;
			case 2:
			oCharacterData.decreaseMaxHP(10);
			break;
			case 3:
			oCharacterData.decreaseMaxHP(15);
			break;
			case 4:
			oCharacterData.decreaseMaxHP(20);
			break;
			case 5:
			oCharacterData.decreaseMaxHP(25);
			break;
		}
	},
	5,setType.iron, sprHelm),
		
	CopperHelm: new Equipment(itemCat.equipment, equipmentTypes.head, "Copper Helm", "It's a Copper Helm", 
	function(level){
		switch(level){
			case 1:
			oCharacterData.increaseMaxHP(5);
			break;
			case 2:
			oCharacterData.increaseMaxHP(10);
			break;
			case 3:
			oCharacterData.increaseMaxHP(15);
			break;
			case 4:
			oCharacterData.increaseMaxHP(20);
			break;
			case 5:
			oCharacterData.increaseMaxHP(25);
			break;
		}
	},
	function(level){
		switch(level){
			case 1:
			oCharacterData.decreaseMaxHP(5);
			break;
			case 2:
			oCharacterData.decreaseMaxHP(10);
			break;
			case 3:
			oCharacterData.decreaseMaxHP(15);
			break;
			case 4:
			oCharacterData.decreaseMaxHP(20);
			break;
			case 5:
			oCharacterData.decreaseMaxHP(25);
			break;
		}
	},
	5,setType.iron, sprCHelm),

	FireAmulet: new Equipment(itemCat.equipment, equipmentTypes.amulet, "Fire Amulet", "Let's you cast Fireball", 
	function(){
		hotkeySpell("FireBall");		
		},
	function(){//This is probably just the hotKeyRemove function
		//oCharacterData.characterData.maxShields -= 5;
		},3,setType.iron, sprAmulet),
	LuckyAmulet: new Equipment(itemCat.equipment, equipmentTypes.amulet, "Lucky Amulet", "Gives you Lucky attack cast", 
	function(){
		hotkeySpell("LuckyAttack");		
		},
	function(){//This is probably just the hotKeyRemove function
		//oCharacterData.characterData.maxShields -= 5;
		}, 3,setType.iron, sprAmulet),

	HealthPotion: new  Consumable(itemCat.consumable, "Health Potion", "This is a health potion",
	function(){return oCharacterData.heal(5);},
	5, sprUiHealthPotion),

	FireBall: new spellCreate(itemCat.spell, spellType.attack, spellElement.fire, "Fire Ball", "It's a fireball", 
	function(){oCharacterData.getTarget().enemyTakeDamage(10);},
	5, sprAmulet),
	
	LuckyAttack: new spellCreate(itemCat.spell, spellType.boardChange, spellElement.pure, "Lucky Attack", "Change your luck for attacks",
	function(){scrChangeJewel(jewelType.luck, jewelType.attack);},
	5, sprAmulet)

}

#region ///Constructors
function Equipment (itemType,equipmentType,itemName,description,onEquip,onDequip,cost,set, sprite) constructor{
  self.itemType = itemType
  self.equipmentType = equipmentType
  self.itemName =  itemName
  self.description = description
  self.onEquip = onEquip
  self.onDequip = onDequip
  self.cost = cost
  self.set = set
  self.sprite = sprite //probably group them, so all swords are one sprite, and then have the sprite_index be the specific sword
}

function Weapon (itemType,equipmentType,itemName,description, damage, onEquip,onDequip,cost,set, sprite) constructor{
  self.itemType = itemType
  self.equipmentType = equipmentType
  self.itemName =  itemName
  self.description = description
  self.damage = damage
  self.onEquip = onEquip
  self.onDequip = onDequip
  self.cost = cost
  self.set = set
  self.sprite = sprite //probably group them, so all swords are one sprite, and then have the sprite_index be the specific sword
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
        show_debug_message("isEquipped: " + string(isEquipped) + string(self));
        if(isEquipped){
            lookUp.onDequip(self.lookUp, level);
            level ++;
            lookUp.onEquip(self.lookUp, level);
        } else {
            show_debug_message("is not equipped");
            level ++;
        }
    }
}

function Consumable (itemType,itemName,description,onConsume,cost,sprite) constructor{
  self.itemType = itemType
  self.itemName =  itemName
  self.description = description  
  self.onConsume = onConsume
  self.cost = cost
  self.sprite = sprite
}

function ConsumableItem (_consumable) constructor {
	lookUp = _consumable;
}

function spellCreate (itemType, spellType, spellElement, spellName, spellDescription, onCast, cost, sprite) constructor{
	self.itemType = itemType
	self.spellType = spellType
	self.spellElement = spellElement
	self.spellName = spellName
	self.spellDescription = spellDescription
	self.onCast = onCast
	self.cost = cost;
	self.sprite = sprite;
}

function useableSpell (_spell) constructor{
	self.lookUp = _spell;
	self.level = 1;
}
#endregion

function hotkeySpell(spell){
	var freeCell = oDragDropController.spellHotbarGroup.getFreeCell();
	var curSpell = new useableSpell(getItemData(spell));
	freeCell.giveItem(curSpell);	
}

function groupItemOnType(_list, _type){
    //var list = variable_struct_get_names(oLookUpTable.lookUpTable);
    type = _type;
	list = _list;
    forEachArray(variable_struct_get_names(global.lookUpTable), function(item){
        if(getItemData(item).itemType == type){
            ds_list_add(list, getItemData(item));
        }
    })
}

function getItemData(item){
    return variable_struct_get(global.lookUpTable, item)
}

enum equipmentTypes{
	head,
	chest,
	gloves,
	boots,
	legs,
	weapon,
	shield,
	amulet,
	none
}

enum itemCat{
	material,
	consumable,
	equipment,
	spell
}

enum spellType{
	attack,
	boardChange
}

enum spellElement{
	fire,
	ice,
	pure
}
