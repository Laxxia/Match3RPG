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
		var item = new ConsumableItem(global.lookUpTable.HealthPotion);
		currentPayload = item;
		isDragging = true;
	}
}

if(keyboard_check(vk_space)){
	if(mouse_check_button_pressed(mb_right)){
		var item = new equipableGear(global.lookUpTable.CopperSword);
		var cell = inventoryGroup.getFreeCell(item);
		cell.giveItem(item);
	}
}



if(currentPayload){
var shouldPerformDrop = isDragging ? !mouse_check_button(mb_left) : mouse_check_button_pressed(mb_left);
	if(shouldPerformDrop){
		if(hoverCell != noone){
			if(hoverCell.canAcceptItem(currentPayload)){
				//If the cell already is populated
				var previousItem = hoverCell.takeItem();
				hoverCell.giveItem(currentPayload);
				currentPayload = undefined;
				if(dragCell != noone){ 
					if(previousItem != undefined){
					    //if the cell you came from isn't valid for the new item
						if(!dragCell.canAcceptItem(previousItem)){
					        currentPayload = previousItem;
							isDragging = false;
					    }else{
							dragCell.giveItem(previousItem);
					    }
					}
					//Complete interaction
					dragCell.onDragSuccess();
					dragCell = noone;
				}
			}
		} else {	
			//could not find cell, cancel operation
			if(dragCell != noone){
				dragCell.onDragCancel();
				dragCell = noone;
				currentPayload = undefined;
			}
		}
		isDragging = false;
	}
}else {
	//Pickup code
	if(mouse_check_button_pressed(mb_left)){
		if(hoverCell != noone && hoverCell.containedItem != undefined){
			currentPayload = hoverCell.startDrag();
			dragCell = hoverCell;
			isDragging = true;
		}		
	}
	
	if(mouse_check_button_pressed(mb_right)){
		if(hoverCell != noone && hoverCell.containedItem != undefined){
			if(hoverCell.containedItem.lookUp.itemType == itemCat.equipment){
				var inst = instance_create_layer(room_width/2, room_height/2, "Instances", oGearLvlUpMenu);
				inst.giveItem(hoverCell.containedItem);
			}
		}
	}
}