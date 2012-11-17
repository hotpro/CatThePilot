package com.nana.petadventure.enemy 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import com.nana.petadventure.event.GameEvent;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.nana.petadventure.GameWorld;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class EnemyCtrl extends Sprite
	{
		private var _tarTimer:Timer;
		private var _enemylv:int;
		private var _interval:int;
		private const MAX_INTERVAL:int = 2000;
		private var _gamelv:int;
		
		public function EnemyCtrl(lv:int) 
		{
			_gamelv = lv;
			_enemylv = 0;
			this.addEventListener("enemyUp", enemyUpgradeHandler);
		}
		
		public  function get enemyLv() : int
		{
			return _enemylv;
		}
		private function onTarTimerHandler(e:TimerEvent)
		{
			var no:int;
			var tar:EnemyBase;
			
			switch (_gamelv)
			{
				case 1:					
				case 2:
					no = 1;
					break;
				case 3:
				case 4:
					no = Math.ceil(Math.random() * 3);
					break;
				case 5:
				case 6:
					no = Math.ceil(Math.random() * 6);
					break;
				case 7:
				case 8:
					no = Math.ceil(Math.random() * 10);
					break;
				case 9:
				case 10:
				case 12:
					no = Math.ceil(Math.random() * 15);
					break;
				case 11:
					no = 0;
					break;
			}
			if (no == 1)
			{
				tar = new Seagull();
			}
			else if ( no > 1 && no <= 3)
			{
				tar = new Bird();
			}else if ( no > 3 && no <=6)
			{
				tar = new Helicopter();
			}else if (no > 6 && no <= 10)
			{
				tar = new Plane();
			}else if (no > 10 && no <= 15)
			{
				tar = new BigPlane();
			}else {
				tar = new Balloon();
			}
			
			GameWorld.instance.enemyLayer.addChild(tar);
			GameWorld.instance.enemyarr.push(tar);
			tar.x = 0;
			tar.y = Math.floor(Math.random() * 200) + 100;
		}
		
		private function enemyUpgradeHandler(e:Event)
		{
			
			_enemylv += 1;
			trace("enemyup", _enemylv);
			
			if (_tarTimer)
			{
				_tarTimer.stop();
				_tarTimer = null;
			}
			if (_gamelv != 11 && _gamelv != 12)
			{
				_interval = MAX_INTERVAL - _enemylv * 100 - _gamelv * 50;
			}else
			{
				_interval = MAX_INTERVAL - 500 - _enemylv * 100;
			}
			
			_tarTimer = new Timer(_interval);
			_tarTimer.addEventListener(TimerEvent.TIMER, onTarTimerHandler);
			_tarTimer.start();
		}
		
		public function destroy() : void
		{
			_tarTimer.stop();
			this.removeEventListener("enemyUp", enemyUpgradeHandler);
			_enemylv = 0;
		}

	}

}