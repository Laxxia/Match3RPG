function scr_backup_jewels() {
	counter = 0;

	with(o_jewel)
	{
	  global.backup_pos[other.counter, 0] = id;
	  global.backup_pos[other.counter, 1] = x;
	  global.backup_pos[other.counter, 2] = y;

	  other.counter++;
	}

}

function scrChangeJewel(_type, _newType){
	with(o_jewel){
		if(gemType = _type){
			gemType = _newType;
			image_index = _newType;
		}
	}
}

