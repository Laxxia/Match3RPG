/// @description Insert description here
// You can write your code in this editor
closeButton = instance_create_layer(x + sprite_width/2 - 64, y - sprite_height/2,"WindowButtons", oButtonCloseWindow);
closeButton.creator = id;
itemCount = 3;

itemPool = ds_list_create();

groupItemOnType(itemPool, itemCat.equipment);
ds_list_shuffle(itemPool);

itemsSelected = [];


var rand = -1;
for (var i = 0; i < itemCount; i++){
	rand = irandom(ds_list_size(itemPool) - 1);
	itemsSelected[i] = ds_list_find_value(itemPool, rand);
	ds_list_delete(itemPool, rand);
}

closeWindow = function(){
	oItemShop.leaveShop();
	ds_list_destroy(itemPool);
	instance_destroy(closeButton);
	instance_destroy();
}

purchase = function(item){
	return oCharacterData.spendGold(item.cost);
}