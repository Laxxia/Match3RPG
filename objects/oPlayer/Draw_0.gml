/// @description Insert description here
// You can write your code in this editor
draw_text(x - sprite_width/2, y - 150, string(state));
draw_text(x, y + 100, "hp: " + string(global.characterData.curHP) + "/" + string(global.characterData.maxHP));
draw_text(x, y + 200, "shields: " + string(global.characterData.curShields));
draw_text(x, y + 300, "mana: " + string(global.characterData.curMana));
draw_text(x, y + 400, "Gold: " + string(global.characterData.gold));
draw_self();