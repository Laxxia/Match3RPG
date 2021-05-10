/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

castSpell = function(spell){
	if(containedItem != undefined){
		var cost = containedItem.lookUp.cost
		var canCast = oCharacterData.spendMana(cost);
		if(containedItem.lookUp.spellType == spellType.attack){
			if(oCharacterData.getTarget() != noone){
				if(canCast){
					containedItem.lookUp.onCast(containedItem.level);
				}
			}
		}
		if(containedItem.lookUp.spellType == spellType.boardChange){
			if(canCast){
				containedItem.lookUp.onCast(containedItem.level);
			}
		}
	}
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
	draw_text(x, y, castKey); 
	draw_set_font(font0);
}