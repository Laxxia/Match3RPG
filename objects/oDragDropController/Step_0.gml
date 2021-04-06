/// @description Insert description here
// You can write your code in this editor
hoverCell = noone;
with(oUICellSlot){
	if(isHovered){
		other.hoverCell = self;
		break;
	}
}
//debug gimme item
if(keyboard_check(vk_space)){
	if(mouse_check_button(mb_left)){
		var item = new equipableGear(global.lookUpTable.IronSword);
		currentPayload = item;
		isDragging = true;
	}
}

if(keyboard_check(vk_shift)){
	if(mouse_check_button(mb_left)){
		var item = new equipableGear(global.lookUpTable.HealthPotion);
		currentPayload = item;
		isDragging = true;
	}
}



if(currentPayload){
var shouldPerformDrop = isDragging ? !mouse_check_button(mb_left) : mouse_check_button_pressed(mb_left);
	if(shouldPerformDrop){
		if(hoverCell != noone /*&& hoverCell.containedItem == undefined*/){
			//if((hoverCell.dropTags & currentPayload.dragDropTag) == hoverCell.dropTags){
				//Bind to cell
			var _swapItemOrTrue = hoverCell.onDrop(currentPayload);
			if(_swapItemOrTrue == true){
				// successful! hover cell now owns payload. Clear OPERATION of ownership
				//Edge case here where the dragCell's Cache won't clear
				if(dragCell != noone){
					dragCell.onDragSuccess();
					dragCell = noone;
				}
				currentPayload = undefined;
			}else if(_swapItemOrTrue != undefined){
				// must be a struct, so we probably got an item back. assign it to drag cell and release ownership
				//There's an edge case here, where we don't have a drag cell. 
				if(dragCell != noone){
					dragCell.onDrop(_swapItemOrTrue);
					dragCell.onDragSuccess();
					dragCell = noone;
					currentPayload = undefined;
				} else {currentPayload = _swapItemOrTrue;}
			}else{
				// failed! tell drag cell that its drag canceled and clear OPERATION of ownership
				if(dragCell != noone){
					dragCell.onDragCancel();
					dragCell = noone;
					currentPayload = undefined;
				}
				isDragging = false;
			}
			//}

		}else {	
			//could not find cell, cancel operation
			if(dragCell != noone){
				dragCell.onDragCancel();
				dragCell = noone;
			}
		}
		isDragging = false;
	}

}else {
	if(mouse_check_button(mb_left)){
		if(hoverCell != noone && hoverCell.containedItem != undefined){
			currentPayload = hoverCell.startDrag();
			dragCell = hoverCell;
			isDragging = true;
		}		
	}
}