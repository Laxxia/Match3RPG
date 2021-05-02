// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Delegate() constructor { 
   handlers = ds_list_create(); 
   
   Invoke = function(args){ 
      for(var i = 0; i < ds_list_size(handlers); i++){
		ds_list_find_value(handlers, i)(args);
      }
   }

   AddListener= function(listener){
       ds_list_add(handlers, listener);
   }
}