package com.nana.petadventure.pet 
{
	import flash.events.Event;
	import com.nana.petadventure.GameWorld;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class Cat extends PetBase
	{
		private var _curStatus:String;
		
		public function Cat() 
		{
			this.x = 480;
			this.y = 200;
			hp = 100;
			speed = 1;
			_curStatus = "normal";
		}
		
		public function startFly() : void
		{
			
		}
		
		public function reduceHp(num:int) : void
		{
			if (this.isInvinciblity == true)
			{
				
			}else
			{
				this.hp -= num;
				GameWorld.instance.info.hpbar.hpline.width -= num;
				if (this.hp <= 0)
				{
					this.hp = 0;
					GameWorld.instance.info.hpbar.hpline.width = 0;
					GameWorld.instance.gameOver();
				}
			}			
		}
		
		public function addHp(num:int) : void
		{
			this.hp += num;
			GameWorld.instance.info.hpbar.hpline.width += num;
			if (this.hp >= 100)
			{
				this.hp = 100;
				GameWorld.instance.info.hpbar.hpline.width = 100;
			}
		}
		
		public function petStatus(status:String)
		{
			if (status != _curStatus)
			{
				_curStatus = status;
				this.gotoAndPlay(status);
			}
			
		}
		
	}

}