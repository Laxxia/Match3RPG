/// @description Insert description here
// You can write your code in this editor
if (event_data[? "event_type"] == "sprite event"){
	switch(event_data[? "message"]){
		case "attackEnemy":
			oCharacterData.getTarget().enemyTakeDamage(tempDamage);
			break;
	}
}