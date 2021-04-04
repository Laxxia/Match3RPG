/// @description Insert description here
// You can write your code in this editor

//so we should be able to take this code and kinda start converting it into our inventory, maybe, uhm, I think the only issue
//oh I guess we could add it to a list and then move through the list?

currentPayload = undefined;
hoverCell = noone;
dragCell = noone;
isDragging = false;

function dragDropPayload(_item, _dragDropTag) constructor {
	sprite = _item.lookUp.sprite;
	dragDropTag = _dragDropTag;
}

