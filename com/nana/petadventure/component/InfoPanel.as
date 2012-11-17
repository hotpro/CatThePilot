package com.nana.petadventure.component 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class InfoPanel extends Sprite
	{
		
		public function InfoPanel() 
		{
			this.speedUpTimeline.visible = false;
			this.bulletTimeline.visible = false;
			this.shieldTimeline.visible = false;
			this.distanceTXT.text = "0" + "m";
			//this.scoreTXT.text = "0"
		}
		
	}

}