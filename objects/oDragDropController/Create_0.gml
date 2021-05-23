/// @description Insert description here
// You can write your code in this editor

//so we should be able to take this code and kinda start converting it into our inventory, maybe, uhm, I think the only issue
//oh I guess we could add it to a list and then move through the list?

currentPayload = undefined;
hoverCell = noone;
dragCell = noone;
isDragging = false;
inventoryGroup = noone
consumablesGroup = noone 
potionsHotbarGroup = noone;
spellHotbarGroup = noone;

inventoryGroup = new cellGroup(oUICellGearInv);
consumablesGroup = new cellGroup(oUICellConsumableInv);
potionsHotbarGroup = new cellGroup(oUICellPotionHotbar);
spellHotbarGroup = new cellGroup(oUICellSpellHotbar);

				
initializeInventory = function(){
	var item = new equipableGear(getItemData("IronSword"));
	var cell = inventoryGroup.getFreeCell(item);
	cell.giveItem(item);
}

initializeInventory();