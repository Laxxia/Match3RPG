/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
ItemAdded.AddListener(function(args){
    var item = args;
    if(oPlayer != noone){
        oCharacterData.equip(item);
    }
});
ItemRemoved.AddListener(function(args){
    var item = args;
    if(oPlayer != noone){
        oCharacterData.unequip(item);
    }
});
Parent_Validate = Validate;
Validate = function(payload){
   var parentYes = Parent_Validate(payload);
   if(!parentYes) return false;
   if(payload.lookUp.itemType == itemCat.equipment && payload.lookUp.equipmentType == designatedEquip){return true}
   return false;
}
