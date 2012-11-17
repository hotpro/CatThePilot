package com.nana.petadventure.bonus 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.nana.petadventure.GameWorld;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class BonusCtrl
	{
		private var _bonusTimer:Timer;
		private var _gamelv:int;
		
		public function BonusCtrl(lv:int) 
		{
			_gamelv = lv;
			_bonusTimer = new Timer(12000);
			_bonusTimer.addEventListener(TimerEvent.TIMER, bonusTimerHandler);
			_bonusTimer.start();
		}
		
		private function bonusTimerHandler(e)
		{
			var no:int;
			var bonus:*;
			switch (_gamelv)
			{
				case 2:
				case 3:
					no = 1;
					break;
				case 4:
				case 5:
					no = Math.ceil(Math.random() * 2);
					break;
				case 6:
				case 7:
					no = Math.ceil(Math.random() * 3);
					break;
				case 8:
				case 9:
					no = Math.ceil(Math.random() * 4);
					break;
				case 10:
				case 12:
					no = Math.ceil(Math.random() * 5);
					break;
			}
			switch (no)
			{
				case 1:
					bonus = new Fruit();
					break;
				case 2:
					bonus = new Bullet();
					break;
				case 3:
					bonus = new SpeedUp();
					break;
				case 4:
					bonus = new Invincibility();
					break;
				case 5:
					bonus = new Canon();
					break;
			}
			
			if (bonus)
			{
				GameWorld.instance.bonusLayer.addChild(bonus);
				GameWorld.instance.bonusarr.push(bonus);
				bonus.x = 0;
				bonus.y = Math.floor(Math.random() * 200) + 100;
			}
			
		}
		
		public function destroy() : void
		{
			_bonusTimer.stop();
			_bonusTimer.removeEventListener(TimerEvent.TIMER, bonusTimerHandler);
			_bonusTimer = null;
		}
		
	}

}