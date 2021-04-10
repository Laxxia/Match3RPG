/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
ItemAdded.AddListener(function(){
	if(oPlayer != noone){
		oPlayer.equip(containedItem);
	}
});
ItemRemoved.AddListener(function(){
	if(oPlayer != noone){
		oPlayer.unequip(containedItem);
	}
});

Parent_Validate = Validate;
Validate = function(payload){
   var parentYes = Parent_Validate(payload);
   if(!parentYes) return false;
   if(payload.lookUp.itemType == itemCat.equipment && payload.lookUp.equipmentType == designatedEquip){return true}
   return false;
}