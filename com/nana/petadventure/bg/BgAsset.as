package com.nana.petadventure.bg 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class BgAsset extends Sprite
	{
		private var _near:NearView;
		private var _mid:MidView;
		private var _far:FarView;
		private var _bgMsk:BgMask;
		
		public function BgAsset() 
		{
			_far = new FarView();
			addChild(_far);			
			_mid = new MidView();
			addChild(_mid);	
			_bgMsk = new BgMask();
			addChild(_bgMsk);
			_near = new NearView();
			addChild(_near);
			
		}
		
		public function bgMove(s:Number) : void
		{		
			_near.moveAtSpeed(s);
			_mid.moveAtSpeed(s);
			_far.moveAtSpeed(s);
			_bgMsk.moveAtSpeed(s);
		}
	}
}