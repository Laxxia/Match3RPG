/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
Parent_Validate = Validate;
Validate = function(payload){
   var parentYes = Parent_Validate(payload);
   if(!parentYes) return false;
   if(payload.lookUp.itemType == itemCat.equipment){return true}
   return false;
}