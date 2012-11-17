package com.nana.petadventure.bonus 
{
	import flash.display.Sprite;
	import com.nana.petadventure.GameWorld;
	import flash.events.Event;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class BonusBase extends Sprite
	{
		public var speed:int;
		public var type:String;
		public static var NORMAL_SPEED:int = 6;
		public static var QUICK_SPEED:int = 12;
		public static var SLOW_SPEED:int = 3;
		
		public function BonusBase() 
		{
			speed = NORMAL_SPEED;
			this.x = -50;
			this.addEventListener(Event.ENTER_FRAME, onFrameEnemyHandler);
		}
		
		private function onFrameEnemyHandler(e)
		{
			this.x += speed;
		}
		
		public function bonusResult() : void
		{
			
		}
	}

}