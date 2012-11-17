package com.nana.petadventure.component 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class HitEffect extends MovieClip
	{
		private var _effectTimer:Timer;
		
		public function HitEffect() 
		{
			
			
		}
		
		public function addEffect(scale:Number, container:DisplayObjectContainer, ex:Number, ey:Number) : void
		{
			_effectTimer = new Timer(300);
			_effectTimer.addEventListener(TimerEvent.TIMER_COMPLETE, effectDisappear);
			this.scaleX = scale;
			this.scaleY = scale;
			container.addChild(this);
			this.x = ex;
			this.y = ey;
			_effectTimer.start();
		}
		
		private function effectDisappear(e)
		{
			
			this.parent.removeChild(this);
		}
	}

}