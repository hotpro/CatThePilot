package com.nana.petadventure.bonus 
{
	import com.nana.petadventure.GameWorld;
	import flash.events.Event;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class Bullet extends BonusBase
	{
		public function Bullet() 
		{
		}
		
		override public function bonusResult() : void
		{
			GameWorld.instance.bulletCtrl.startShooting();
			GameWorld.instance.info.bulletTimeline.timeline.width = 100;
			GameWorld.instance.info.bulletTimeline.visible = true;
			GameWorld.instance.addEventListener(Event.ENTER_FRAME, onFrameHandler);
		}
		
		private function onFrameHandler(e) : void
		{
			GameWorld.instance.info.bulletTimeline.timeline.width -= 0.5;
			if (GameWorld.instance.info.bulletTimeline.timeline.width <= 0 || GameWorld.instance.isLevelFinished)
			{
				GameWorld.instance.removeEventListener(Event.ENTER_FRAME, onFrameHandler);
				GameWorld.instance.info.bulletTimeline.visible = false;
				GameWorld.instance.bulletCtrl.stopShooting();
			}
		}
	}

}