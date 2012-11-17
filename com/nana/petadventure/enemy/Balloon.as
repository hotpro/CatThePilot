package com.nana.petadventure.enemy 
{
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class Balloon extends EnemyBase
	{
		
		public function Balloon() 
		{
			var no:int;
			no = Math.ceil(Math.random() * 4);
			this.gotoAndStop(no);
			weight = 5;
			speed = NORMAL_SPEED_BASE * weight;
			attack = 20;
		}
		
	}

}