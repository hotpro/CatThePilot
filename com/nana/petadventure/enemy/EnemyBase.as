package com.nana.petadventure.enemy 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.nana.petadventure.GameWorld;
	import com.nana.petadventure.bg.BgBase;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class EnemyBase extends MovieClip
	{
		public var speed:int;
		public var speedY:int;
		public var hp:int;
		public var attack:int;
		public static const NORMAL_SPEED_BASE:int = 2;
		public static const QUICK_SPEED_BASE:int = 4;
		public static const SLOW_SPEED_BASE:int = 1;
		public var weight:int;
		public var ability:String;
		
		public function EnemyBase() 
		{
			this.x = -50;
			this.addEventListener(Event.ENTER_FRAME, onFrameEnemyHandler);
		}
		
		private function onFrameEnemyHandler(e)
		{
			switch (GameWorld.instance.bgSpeed)
			{
				case BgBase.SPEED_NORMAL:
					speed = NORMAL_SPEED_BASE * weight;
					break;
				case BgBase.SPEED_QUICK:
					speed = QUICK_SPEED_BASE * weight;
					break;
				case BgBase.SPEED_SLOW:
					speed = SLOW_SPEED_BASE * weight;
					break;
			}
			switch (ability)
			{
				case "upanddown":
					upAndDown();					
					break;
				case "chasing":
					chasing();
					break;
				case "accelerate":
					accelerate();
					break;
			}
			this.x += speed;
		}
		
		private function upAndDown() : void
		{
			if (this.y <= 100)
			{
				this.speedY = 3;
			}else if (this.y >= 300)
			{
				this.speedY = -3;
			}
			this.y += this.speedY;
		}
		
		private function chasing() : void
		{
			if (this.y > GameWorld.instance.pet.y)
			{
				this.y -= 1.5;
			}else
			{
				this.y += 1.5;
			}
		}
		
		private function accelerate() : void
		{
			this.speed += 5;
			
		}
		
		public function reduceHp(num:int) : Boolean
		{
			this.hp -= num;
			if (this.hp <= 0)
			{
				return true;
			}
			return false;
		}
	}

}