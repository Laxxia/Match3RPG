// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrNewMatch(matchList, _gemType) constructor{
	var _matchSize = ds_list_size(matchList)
		if (_matchSize > 3){
			special = matchList[| irandom_range(0, _matchSize - 1)] ;	
		} else {special = noone;}
		gemAction = _gemType;
		matchSize = _matchSize;
}