package com.nana.petadventure.weapon 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import com.nana.petadventure.GameWorld;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class BulletBase extends Sprite
	{
		public var speed:int;
		public var attack:int;
		public var interval:int;
		public var type:String;
		
		public function BulletBase() 
		{
			this.x = GameWorld.instance.pet.x;
			this.y = GameWorld.instance.pet.y;
			this.addEventListener(Event.ENTER_FRAME, onFrameBulletHandler);
		}
		
		private function onFrameBulletHandler(e)
		{
			this.x -= speed;
		}
	}

}