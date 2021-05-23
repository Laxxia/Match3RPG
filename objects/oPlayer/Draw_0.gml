/// @description Insert description here
// You can write your code in this editor
draw_self();

if(oCharacterData.getCurHP() < oCharacterData.getMaxHP()){
	draw_sprite_stretched(sprHealthBar, 1, x - 45, y - 100, 100 , 20);
	draw_sprite_stretched(sprHealthBar, 0, x - 45, y - 100, (oCharacterData.getCurHP()/oCharacterData.getMaxHP())* 100, 20);
}

if(oCharacterData.getCurShields() > 0){
	draw_sprite_stretched(sprHealthBar, 1, x - 45, y - 125, 100 , 20);
	draw_sprite_stretched(sprShieldBar, 0, x - 45, y - 125, (oCharacterData.getCurShields()/oCharacterData.getMaxShields())* 100, 20);
}