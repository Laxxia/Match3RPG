/// @description Insert description here
// You can write your code in this editor
if(containedItem != undefined && isHovered){
	if(contItem.itemType == itemCat.equipment){
		if(contItem.equipmentType == equipmentTypes.weapon){
			scrItemHover(contItem.sprite, contItem.itemName, "Common", contItem.damage * containedItem.level, contItem.description, c_lime, "", "", "Right Click to level" );
		} else {
			scrItemHover(contItem.sprite, contItem.itemName, "Common", 10, contItem.description, c_lime, "", "", "Right Click to level" );
		}
	}
}
