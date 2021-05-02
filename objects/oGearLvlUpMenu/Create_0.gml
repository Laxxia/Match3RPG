/// @description Insert description here
// You can write your code in this editor
targetItem = undefined;
buffer = 10;

levelUpButton = instance_create_layer(x + sprite_width/2 - 64, y, "WindowButtons", oButtonLevelUp);
closeButton = instance_create_layer(x + sprite_width/2 - 64, y - sprite_height/2,"WindowButtons", oButtonCloseWindow);
closeButton.creator = id;

closeWindow = function(){
	global.pause = false;
	instance_destroy(levelUpButton);
	instance_destroy(closeButton);
	instance_destroy();
}


giveItem = function(item){
	targetItem = item;
	levelUpButton.item = targetItem;
}