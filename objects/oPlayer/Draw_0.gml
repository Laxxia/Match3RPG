/// @description Insert description here
// You can write your code in this editor
draw_self();

if(oCharacterData.getCurHP() < oCharacterData.getMaxHP()){
	draw_sprite_stretched(sprHealthBar, 1, x - 25, y - 100, 100 , 20);
	draw_sprite_stretched(sprHealthBar, 0, x - 25, y - 100, (oCharacterData.getCurHP()/oCharacterData.getMaxHP())* 100, 20);
}