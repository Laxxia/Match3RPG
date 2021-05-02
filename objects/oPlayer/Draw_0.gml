/// @description Insert description here
// You can write your code in this editor
draw_set_font(fntInfo);
draw_text(x - sprite_width/2, y - 150, string(state));
draw_text(x, y + 100, "hp: " + string(global.characterData.curHP) + "/" + string(global.characterData.maxHP));
draw_text(x, y + 125, "shields: " + string(global.characterData.curShields));
draw_text(x, y + 150, "mana: " + string(global.characterData.curMana));
draw_text(x, y + 175, "Gold: " + string(global.characterData.gold));
draw_text(x, y + 200, "Xperience: " + string(global.characterData.curXP));

if(global.playerGear.helmet.item != -1){
	draw_text(x, y + 200, "Helmet: " + string(global.playerGear.helmet.item.lookUp.itemName));
}
if(global.playerGear.weapon.item != -1){
	draw_text(x, y + 225, "Weapon: " + string(global.playerGear.weapon.item.lookUp.itemName));
}

draw_set_font(font0);
draw_self();