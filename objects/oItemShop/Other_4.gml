/// @description Insert description here
// You can write your code in this editor
var list = variable_struct_get_names(oLookUpTable.lookUpTable);
var ran = irandom_range(0, array_length(list) - 1);
var item = variable_struct_get(oLookUpTable.lookUpTable, list[ran]);


sprite_index = item.sprite;
IID = item;

