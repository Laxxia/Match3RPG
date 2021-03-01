event_inherited();

instance_deactivate_object(o_pause_button);

button[0] = instance_create_depth(x-sprite_width/3, y + sprite_height/2 - 100, -200, o_menu_button);
button[0].script = scr_menu;
button[1] = instance_create_depth(x, y + sprite_height/2 - 100, -200, o_restart_level_button);
button[1].script = scr_restart_level;
button[2] = instance_create_depth(x+sprite_width/3, y + sprite_height/2 - 100, -200, o_resume_button);
button[2].script = scr_resume;


