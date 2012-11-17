package com.nana.petadventure.enemy 
{
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class Helicopter extends EnemyBase
	{		
		public function Helicopter() 
		{
			weight = 4;
			hp = 2;
			speed = NORMAL_SPEED_BASE * weight;
			attack = 15;
			ability = "upanddown";
			speedY = 3;
		}
		
	}

}