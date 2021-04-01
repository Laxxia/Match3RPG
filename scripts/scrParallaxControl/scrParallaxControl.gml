// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrParallaxControl(paused){
	var lay_id1 = layer_get_id("BG1");
	var lay_id2 = layer_get_id("BG2");
	var lay_id3 = layer_get_id("BG3");
	//This could all be done with a for loop and two arrays, think about it
	if(paused){
		layer_hspeed(lay_id1, 0);
		layer_hspeed(lay_id2, 0);
		layer_hspeed(lay_id3, 0);
	} else {
		layer_hspeed(lay_id1, global.hspds[0]);
		layer_hspeed(lay_id2, global.hspds[1]);
		layer_hspeed(lay_id3, global.hspds[2]);
	}
	
}