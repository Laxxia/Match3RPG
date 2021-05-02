/// @description Insert description here
// You can write your code in this editor
targetItem = undefined;
buffer = 10;

levelUpButton = instance_create_layer(x + sprite_width - 64, y, "Instances", oButtonLevelUp);




giveItem = function(item){
	targetItem = item;
	levelUpButton.item = targetItem;
}