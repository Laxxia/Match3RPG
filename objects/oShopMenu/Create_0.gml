/// @description Insert description here
// You can write your code in this editor
closeButton = instance_create_layer(x + sprite_width/2 - 64, y - sprite_height/2,"WindowButtons", oButtonCloseWindow);
closeButton.creator = id;

closeWindow = function(){
	oItemShop.leaveShop();
	instance_destroy(closeButton);
	instance_destroy();
}
