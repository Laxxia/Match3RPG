function scr_restart_level() {
	global.pause = false;
	oCharacterData.characterInstantiate();
	room_restart();

}
