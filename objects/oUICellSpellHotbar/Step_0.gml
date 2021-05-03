/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(keyboard_check_pressed(ord(string(orderIndex + 1)))){
	consumePotion();
}