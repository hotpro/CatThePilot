package com.nana.petadventure.bonus 
{
	import com.nana.petadventure.GameWorld;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class Canon extends BonusBase
	{
		
		public function Canon() 
		{
		}
		
		override public function bonusResult() : void
		{
			GameWorld.instance.canonExplode();
		}
		
	}

}