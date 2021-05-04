/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

consumePotion = function(){
	if(containedItem != undefined){
		var wasConsumed = containedItem.lookUp.onConsume();
		if(wasConsumed){
			containedItem = undefined;
		}
	}
}

Parent_Validate = Validate;
Validate = function(payload){
   var parentYes = Parent_Validate(payload);
   if(!parentYes) return false;
   if(payload.lookUp.itemType == itemCat.consumable){return true}
   return false;
}

infoDraw= function(){
	var _color = isHovered ? c_red : c_white;
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, _color, 1);
	if(containedItem != undefined){
		draw_sprite(containedItem.lookUp.sprite, 0, x, y);
	}

	if(cachedItem != undefined){
		draw_sprite_ext(cachedItem.lookUp.sprite, 0, x, y, 1, 1, 0, _color, 0.3);
	}

	draw_set_font(fntInfo);
	draw_text(x, y, orderIndex + 1); 
	draw_set_font(font0);
}