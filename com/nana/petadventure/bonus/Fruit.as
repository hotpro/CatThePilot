package com.nana.petadventure.bonus 
{
	import com.nana.petadventure.GameWorld;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class Fruit extends BonusBase
	{
		public var val:int;
		
		public function Fruit() 
		{
			val = 20;
		}
		
		override public function bonusResult() : void
		{
			GameWorld.instance.pet.addHp(val);
		}
		
	}

}