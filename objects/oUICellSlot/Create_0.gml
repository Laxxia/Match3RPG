/// @description Insert description here
// You can write your code in this editor
width = sprite_width;
height = sprite_height;
isHovered = false;
containedItem = undefined;
cachedItem = undefined;
orderIndex = -1;

ItemAdded = new Delegate();
ItemRemoved = new Delegate();
HoveredStart = new Delegate();
HoveredEnd = new Delegate();
Dropped = new Delegate();

HoveredStart.AddListener(function(){
	isHovered = true;
});

HoveredEnd.AddListener(function(){
	isHovered = false;
});

/*onDrop = function(payload){
    if(TryReceiveDrop(payload)){
        var _lastContainedItem = containedItem;
        containedItem = payload;
        if(_lastContainedItem != undefined){
            return _lastContainedItem;
        }
        return true;
    }
    return undefined;
}; 
*/
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

canAcceptItem = function(payload){
	return Validate(payload);
}

giveItem = function(payload){
	containedItem = payload;
	Dropped.Invoke(payload);
	ItemAdded.Invoke(payload);
}

takeItem = function(){
	if(containedItem != undefined){
		ItemRemoved.Invoke(containedItem);
	}
	return containedItem;
}

Validate = function(payload){return true};
