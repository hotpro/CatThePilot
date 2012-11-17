package com.nana.petadventure.bonus 
{
	import com.nana.petadventure.GameWorld;
	import com.nana.petadventure.StartMenu;
	import com.nana.petadventure.bg.BgBase;
	import com.nana.petadventure.sound.SoundSpeedUp;
	import flash.events.Event;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class SpeedUp extends BonusBase
	{		
		public function SpeedUp() 
		{
		}
		
		override public function bonusResult() : void
		{
			StartMenu.instance.sound.playSound("speedup");
			GameWorld.instance.bgSpeed = BgBase.SPEED_QUICK;
			GameWorld.instance.addEventListener(Event.ENTER_FRAME, onFrameHandler);
			GameWorld.instance.info.speedUpTimeline.visible = true;
			GameWorld.instance.info.speedUpTimeline.timeline.width = 100;
		}
		
		private function onFrameHandler(e) : void
		{
			GameWorld.instance.info.speedUpTimeline.timeline.width -= 0.5;
			if (GameWorld.instance.info.speedUpTimeline.timeline.width <= 0 || GameWorld.instance.isLevelFinished)
			{
				GameWorld.instance.bgSpeed = BgBase.SPEED_NORMAL;
				GameWorld.instance.info.speedUpTimeline.visible = false;
				GameWorld.instance.removeEventListener(Event.ENTER_FRAME, onFrameHandler);
				
			}
		}
		
	}

}