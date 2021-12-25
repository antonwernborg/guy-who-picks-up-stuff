// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_drop_item(obj, item){
	obj.has_item = false;
	item.pickup = false;
}