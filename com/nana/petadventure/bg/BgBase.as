package com.nana.petadventure.bg 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class BgBase extends Sprite
	{
		public var speedBase:Number;
		public var weight:Number;
		public static var SPEED_NORMAL:Number = 2;
		public static var SPEED_QUICK:Number =4
		public static var SPEED_SLOW:Number = 1;
		
		public function BgBase() 
		{
			speedBase = 0;
			this.x = ( -this.width) / 2;
		}
		
		public function moveAtSpeed(s:Number) : void
		{
			this.speedBase = s;
			if (this.x >= 0)
			{
				this.x = ( -this.width) / 2;
			}
			this.x += this.speedBase * weight;
		}
		
	}

}