/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

dropVerification = function(payload){
    if(payload.lookUp.itemType == itemCat.consumable || payload.lookUp.itemType == itemCat.material ){
		return true;
	} else { return false;}
};