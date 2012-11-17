package com.nana.petadventure.component 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class GuidePanel extends MovieClip
	{
		
		public function GuidePanel() 
		{
			this.x = 150;
			this.y = 130;
			this.visible = false;
			this.goBTN.addEventListener(MouseEvent.CLICK, goClickHandler);
		}
		
		public function showPanel(index:int)
		{
			this.visible = true;
			this.gotoAndStop(index);
		}
		
		private function goClickHandler(e)
		{
			this.visible = false;
			dispatchEvent(new Event("startFlying"));
		}
		
	}

}