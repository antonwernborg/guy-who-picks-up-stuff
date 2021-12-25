/// Movement


// Player Input
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
pickup_key = keyboard_check_pressed(vk_space);

// Calculate Input
hinput = (right - left);
vinput = (down - up);

if (vinput != 0) or (hinput != 0)
{
    dir = point_direction(0,0,hinput,vinput);
    lenx = lengthdir_x(spd,dir);
    leny = lengthdir_y(spd,dir);
        
} else {
    hinput = 0;
    vinput = 0;
}

if (hinput != 0)
{
    hspd += hinput*acc;
    hspd = clamp(hspd,-lenx,lenx);
} else {
    hspd = lerp(hspd,0,fric);
}
    
if (vinput != 0)
{
    vspd += vinput*acc;
    vspd = clamp(vspd,-leny,leny);
} else {
    vspd = lerp(vspd,0,fric);
}


// Horizontal Collisions
if (place_meeting(x+hspd,y,obj_solid))
{
	while(!place_meeting(x+sign(hspd),y,obj_solid))
	{
		x += sign(hspd);	
	}
	hspd = 0;
}
x += hspd;

// Vertical Collision
if (place_meeting(x,y+vspd,obj_solid))
{
	while(!place_meeting(x,y+sign(vspd),obj_solid))
	{
		y += sign(vspd);	
	}
	vspd = 0;
}
y += vspd;


// Picking up items
if (!has_item)
{
	if (distance_to_object(obj_pickup) < pickup_dist)
	{
		if (pickup_key)
		{
			inst = instance_nearest(x,y,obj_pickup);
			inst.pickup = true;
			has_item = true;
			item = inst;
		}
	}
} else {
	if (pickup_key) && (place_free(x,y+pickup_buffer))
	{
		//change buffer has same dir player is facing
		item.y = y+pickup_buffer;
		dis_to_postbox = point_distance(self.x, self.y, obj_postbox.x, obj_postbox.y);
		if (dis_to_postbox < send_dist)
		{
			scr_send_item(self, item);
		}
		else
		{
			scr_drop_item(self, item);
		}
	}
}

// Check if dead
if (hp <= 0)
{
	instance_destroy()	
}

// Powerups
inst = instance_place(x,y,obj_powerup);
if (inst != noone)
{
	spd = max_spd;
	alarm[0] = powerup_cooldown;
	with inst instance_destroy();	
}

//camera_get_view_x()

// Make the view follow the player
/*view_xview[0] += ((x-(view_wview[0]/2)) - view_xview[0]) * 0.06; 
view_yview[0] += ((y-(view_hview[0]/2)) - view_yview[0]) * 0.06;  
