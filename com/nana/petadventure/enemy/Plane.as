package com.nana.petadventure.enemy 
{
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class Plane extends EnemyBase
	{
		
		public function Plane() 
		{
			weight = 6;
			speed = NORMAL_SPEED_BASE * weight;
			hp = 2;
			attack = 20;
			ability = "accelerate";
		}
		
	}

}