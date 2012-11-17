package com.nana.petadventure.enemy 
{
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class BigPlane extends EnemyBase
	{		
		public function BigPlane() 
		{
			weight = 5;
			hp = 3;
			speed = NORMAL_SPEED_BASE * weight;
			attack = 25;
			ability = "chasing";
		}
		
	}

}