/// scr_drop_item();
function scr_drop_item(obj, item){
	obj.item = noone;
	obj.has_item = false;
	item.pickup = false;
}