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
		currentPayload = new dragDropPayload(sprUiHealthPotion, dragDropTags.EquippedGear);
	}
}

if(keyboard_check(vk_shift)){
	if(mouse_check_button(mb_left)){
		currentPayload = new dragDropPayload(sprUiHealthPotion, dragDropTags.EquipmentInventory);
	}
}



if(currentPayload){
	if(!mouse_check_button(mb_left)){
		if(hoverCell != noone && hoverCell.containedItem == undefined){
			
			//if((hoverCell.dropTags & currentPayload.dragDropTag) == hoverCell.dropTags){
			if(dragCell != noone){
				dragCell.onDragSuccess(currentPayload);
				dragCell = noone;
			}
			//Bind to cell
			hoverCell.onDrop(currentPayload);
			currentPayload = undefined;
			//}

		}else {	
			//could not find cell, cancel operation
			if(dragCell != noone){
				dragCell.onDragCancel(currentPayload);
				dragCell = noone;
			}
			currentPayload = undefined;
		}
	} 
}else {
	if(mouse_check_button(mb_left)){
		if(hoverCell != noone && hoverCell.containedItem != undefined){
			currentPayload = hoverCell.startDrag();
			dragCell = hoverCell;
		}		
	}
}