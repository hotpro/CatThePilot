package com.nana.petadventure.tween 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.events.Event;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class TweenZoomOut extends Sprite
	{
		private var _obj:DisplayObject;
		private var _point:Point;
		private var _scale:Number;
		private var _matrix:Matrix;
		private var _time:int;
		private var _last:int;
		private var _count:int;
		public static var SCALE_FAST:Number = 0.8;
		public static var SCALE_NORMAL:Number = 1;
		public static var SCALE_SLOW:Number = 1.2;
		
		public function TweenZoomOut(obj:DisplayObject) 
		{
			_obj = obj;
			
		}
		
		public function execute(scale:Number, point:Point, time:int, last:int) : void
		{
			_count = 0;
			_point = point;
			_scale = scale;
			
			_time = time;
			_last = last;
			
			/*_matrix = _obj.transform.matrix;
			_matrix.translate( -_point.x, -_point.y);
				_matrix.scale(_scale,_scale);
				_matrix.translate(_point.x, _point.y);
				_obj.transform.matrix = _matrix;*/
			//this.addEventListener(Event.ENTER_FRAME, onFrameHandler);
			
		}
		
		private function onFrameHandler(e) 
		{
			if (_scale != _obj.scaleX)
			{
				_scale = (_scale-_obj.scaleX) / _time;
				_matrix = _obj.transform.matrix;
				_matrix.translate( -_point.x, -_point.y);
				_matrix.scale(_scale,_scale);
				_matrix.translate(_point.x, _point.y);
				_obj.transform.matrix = _matrix;
			}			
			_count += 1;
			if (_count >= _count+_last) 
			{
				_scale = SCALE_NORMAL;
				if ( _obj.scaleX == SCALE_NORMAL)
				{
					this.removeEventListener(Event.ENTER_FRAME, onFrameHandler);
				}
				
			}
			
			
		}
		
		
	}

}