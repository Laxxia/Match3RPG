/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(fntInfo);
xBuff = x + 10;
draw_text(xBuff, y + 25, string(oPlayer.state));
draw_text(xBuff, y + 50, "hp: " + string(oCharacterData.getCurHP()) + "/" + string(oCharacterData.getMaxHP()));
draw_text(xBuff, y + 75, "shields: " + string(oCharacterData.getCurShields()));
draw_text(xBuff, y + 100, "mana: " + string(oCharacterData.getCurMana()));
draw_text(xBuff, y + 125, "Gold: " + string(oCharacterData.getCurGold()));
draw_text(xBuff, y + 150, "Xperience: " + string(oCharacterData.getCurXP()));
draw_text(xBuff, y + 175, "Attack: " + string(oCharacterData.getCurAttackDmg()));
draw_text(xBuff, y + 200, "Charge: " + string(oCharacterData.getChargeValue()));

draw_set_font(font0);
