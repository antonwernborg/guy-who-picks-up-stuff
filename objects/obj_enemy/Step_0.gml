/// Following and ataking the player
if (instance_exists(obj_player))
{
	/// attack state
	dir_to_player = point_direction(self.x, self.y, obj_player.x, obj_player.y);
	dis_to_player = point_distance(self.x, self.y, obj_player.x, obj_player.y);
	if (dis_to_player < atk_dis) 
	{
		scr_move(run_spd, dir_to_player);
	}
	else
	{
		/// idle state
		scr_move(walk_spd, rnd_dir);
		if change_dir
		{
			change_dir = false;
			alarm[0] = room_speed*2;
			rnd_dir = random_range(0, 360);
		}
	}
	/// collision w player
	var inst = instance_place(x,y,obj_player);
	if (inst != noone)
	{
		inst.hp -= 10;
		if(inst.item != noone)
		{
			scr_drop_item(inst, inst.item);
		}
		inst.score_points -= 10;
		scr_knockback(inst, force);
	}
}
