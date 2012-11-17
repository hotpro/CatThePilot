package com.nana.petadventure.component 
{
	import flash.display.Shape;
	import flash.events.Event;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class ExplodeShape extends Shape
	{
		private var _speedX:Number;
		private var _speedY:Number;
		private var _color:Number;
		
		public function ExplodeShape(color:Number) 
		{
			_speedX = Math.random() * 10 - 5;
			_speedY = Math.random() * 10 - 5;
			this.graphics.beginFill(color);
            this.graphics.drawRect(0, 0, 5, 5);
			this.addEventListener(Event.ENTER_FRAME, onFrameHandler);
		}
		
		private function onFrameHandler(e)
		{
			this.x += _speedX;
			this.y += _speedY;
			this.alpha -= 0.05;
			if (this.alpha <= 0)
			{
				this.removeEventListener(Event.ENTER_FRAME, onFrameHandler);
				this.parent.removeChild(this);
			}
		}

	}

}