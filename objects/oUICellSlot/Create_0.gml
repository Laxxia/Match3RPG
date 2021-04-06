/// @description Insert description here
// You can write your code in this editor
width = sprite_width;
height = sprite_height;
isHovered = false;
containedItem = undefined;
cachedItem = undefined;

onHoverBegin = function(){
	isHovered = true;
};

onHoverEnd = function(){
	isHovered = false;
};

onDrop = function(payload){
    if(dropVerification(payload)){
        var _lastContainedItem = containedItem;
        containedItem = payload;
        if(_lastContainedItem != undefined){
            return _lastContainedItem;
        }
        return true;
    }
    return undefined;
};

startDrag = function(){
	cachedItem = containedItem;
	containedItem = undefined;
	return cachedItem;

};

onDragSuccess = function(){
	cachedItem = undefined;
}

onDragCancel = function(){
	containedItem = cachedItem;
	cachedItem = undefined;
}
