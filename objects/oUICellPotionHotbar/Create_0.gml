/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

consumePotion = function(){
	containedItem = undefined;
}

Parent_Validate = Validate;
Validate = function(payload){
   var parentYes = Parent_Validate(payload);
   if(!parentYes) return false;
   if(payload.lookUp.itemType == itemCat.consumable){return true}
   return false;
}