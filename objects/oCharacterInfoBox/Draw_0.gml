/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(fntInfo);
xBuff = x + 10;
draw_text(xBuff, y + 25, string(oPlayer.state));
draw_text(xBuff, y + 50, "hp: " + string(getCurHP()) + "/" + string(getMaxHP()));
draw_text(xBuff, y + 75, "shields: " + string(getCurShields()));
draw_text(xBuff, y + 100, "mana: " + string(getCurMana()));
draw_text(xBuff, y + 125, "Gold: " + string(getCurGold()));
draw_text(xBuff, y + 150, "Xperience: " + string(getCurXP()));
draw_text(xBuff, y + 175, "Attack: " + string(getCurAttackDmg()));

if(global.playerGear.helmet.item != -1){
	draw_text(xBuff, y + 200, "Helmet: " + string(global.playerGear.helmet.item.lookUp.itemName));
}
if(global.playerGear.weapon.item != -1){
	draw_text(xBuff, y + 225, "Weapon: " + string(global.playerGear.weapon.item.lookUp.itemName));
}

draw_set_font(font0);
