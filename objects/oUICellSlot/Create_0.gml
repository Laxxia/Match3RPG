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
	cachedItem = undefined;
	containedItem = payload;
	return true;
	//should return undefined or an instance of what it used to contain
};

startDrag = function(){
	cachedItem = containedItem;
	containedItem = undefined;
	//if cool bitmasked hting returns false return swap else return cached item
	return cachedItem;

};

onDragSuccess = function(){
	cachedItem = undefined;
}

onDragCancel = function(){
	containedItem = cachedItem;
	cachedItem = undefined;
}
