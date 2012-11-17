package com.nana.petadventure.component 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class ExplodeEffect extends Sprite
	{
		private var _num:int;
		
		public function ExplodeEffect() 
		{
			
		}
		
		public function showEffect(color:Number, point:Point)
		{
			_num = Math.ceil(Math.random() * 10) + 5;
			for (var i:int = 0; i < _num; i++)
			{
				var s:ExplodeShape = new ExplodeShape(color);
				addChild(s);
				s.x = point.x;
				s.y = point.y;
			}
		}
			
	}

}