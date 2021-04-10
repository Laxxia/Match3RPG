///@func foreach(array, function)
///@desc Emulates foreach funcationality for arrays (Note: This is slowish and not recommended for large arrays)
///@arg array
///@arg function
function forEachArray(_array, _function) {
    for(var i = 0; i < array_length(_array); i++) {
        _function(_array[i]);
    }
}

///@func forEachList(list, function)
///@desc Emulates foreach funcationality for lists (Note: This is slowish and not recommended for large arrays)
///@arg list
///@arg function
function forEachList(_list, _function) {
    for(var i = 0; i < ds_list_size(_list); i++) {
        _function(_list[| i]);
    }
}
