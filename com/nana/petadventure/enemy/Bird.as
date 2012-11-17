package com.nana.petadventure.enemy 
{
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class Bird extends EnemyBase
	{		
		public function Bird() 
		{
			weight = 4;
			hp = 1;
			speed = NORMAL_SPEED_BASE * weight;
			attack = 10;
			ability = "upanddown"; 
			speedY = 3
		}
		
	}

}