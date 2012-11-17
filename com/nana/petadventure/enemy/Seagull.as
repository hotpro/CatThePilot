package com.nana.petadventure.enemy 
{
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class Seagull extends EnemyBase
	{		
		public function Seagull() 
		{
			weight = 3;
			hp = 1;
			attack = 8;
			speed = NORMAL_SPEED_BASE * weight;
			ability = "";
		}
		
	}

}