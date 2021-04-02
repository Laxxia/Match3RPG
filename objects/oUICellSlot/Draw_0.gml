/// @description Insert description here
// You can write your code in this editor
var _color = isHovered ? c_red : c_white;
draw_sprite_ext(sprCell, 0, x, y, 1, 1, 0, _color, 1);
if(containedItem != undefined){
	draw_sprite(containedItem.sprite, 0, x, y);
}

if(cachedItem != undefined){
	draw_sprite_ext(cachedItem.sprite, 0, x, y, 1, 1, 0, _color, 0.3);
}


enum dragDropTags{
	EquippedGear = 1,
	EquipmentInventory = 2,
	MatsInventory = 4
}

