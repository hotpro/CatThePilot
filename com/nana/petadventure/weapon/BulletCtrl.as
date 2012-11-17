package com.nana.petadventure.weapon 
{
	import com.nana.petadventure.component.FireEffect;
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	import flash.utils.getQualifiedClassName;
	import flash.events.KeyboardEvent;
	import com.nana.petadventure.GameWorld;
	import com.nana.petadventure.StartMenu;
	import flash.display.*;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class BulletCtrl extends Sprite
	{
		private var _bulletTimer:Timer;		
		
		public function BulletCtrl() 
		{
			
		}
		
		public function startShooting() : void
		{
			_bulletTimer = new Timer(500);
			_bulletTimer.addEventListener(TimerEvent.TIMER, bulletHandler);
			_bulletTimer.start();
		}
		
		public function stopShooting() : void
		{
			this.destroy();
		}
		private function bulletTimerHandler(e)
		{
			
			addEventListener("fire", bulletHandler);			
		}
		
		private function bulletHandler(e)
		{
			var bul:NormalBullet;
			bul = new NormalBullet();
			GameWorld.instance.bulletarr.push(bul);
			GameWorld.instance.bulletLayer.addChild(bul);
			GameWorld.instance.fire.x = GameWorld.instance.pet.x - 20;
			GameWorld.instance.fire.y = GameWorld.instance.pet.y;
			GameWorld.instance.fire.gotoAndPlay("fire");
			StartMenu.instance.sound.playSound("shoot");
		}
		
		public function destroy() : void
		{
			if (_bulletTimer)
			{
				_bulletTimer.stop();
				_bulletTimer.removeEventListener(TimerEvent.TIMER, bulletHandler);
				_bulletTimer = null;
			}
			
		}
	}

}