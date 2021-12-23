/// Following and ataking the player
if (instance_exists(obj_player))
{
	dir_to_player = point_direction(self.x, self.y, obj_player.x, obj_player.y);
	dis_to_player = point_distance(self.x, self.y, obj_player.x, obj_player.y);
	show_debug_message(dis_to_player);
	if (dis_to_player < atk_dis) 
	{
		show_debug_message("SPRRIIING");
		scr_move(spd, dir_to_player);
	}
	if place_meeting(self.x, self.y, obj_player)
	{
		obj_player.hp -= 10;
		scr_knockback(obj_enemy.force,obj_enemy.dir_to_player);
	}
}