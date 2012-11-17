package com.nana.petadventure.bonus 
{
	import com.nana.petadventure.GameWorld;
	import flash.events.Event;
	import com.nana.petadventure.bg.BgBase;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class Invincibility extends BonusBase
	{
		
		public function Invincibility() 
		{
			
		}
		
		override public function bonusResult() : void
		{
			GameWorld.instance.pet.isInvinciblity = true;
			GameWorld.instance.pet.gotoAndStop("invincibility");			
			GameWorld.instance.bgSpeed = BgBase.SPEED_QUICK;
			GameWorld.instance.info.shieldTimeline.timeline.width = 100;
			GameWorld.instance.info.shieldTimeline.visible = true;
			GameWorld.instance.addEventListener(Event.ENTER_FRAME, onFrameHandler);
		}
		
		private function onFrameHandler(e) : void
		{
			GameWorld.instance.info.shieldTimeline.timeline.width -= 0.5;
			if (GameWorld.instance.info.shieldTimeline.timeline.width <= 0 || GameWorld.instance.isLevelFinished)
			{
				GameWorld.instance.bgSpeed = BgBase.SPEED_NORMAL;
				GameWorld.instance.removeEventListener(Event.ENTER_FRAME, onFrameHandler);
				GameWorld.instance.info.shieldTimeline.visible = false;
				GameWorld.instance.pet.isInvinciblity = false;
				GameWorld.instance.pet.gotoAndStop("normal");
			}
		}
		
	}

}