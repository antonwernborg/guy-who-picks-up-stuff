/// Following the player
if (pickup)
{
	x = (obj_player.x)+sign(obj_player.hinput);
	y = (obj_player.y-buffer)+sign(obj_player.vinput);
}