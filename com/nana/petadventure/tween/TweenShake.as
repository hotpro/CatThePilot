package com.nana.petadventure.tween 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class TweenShake extends Sprite
	{
		
		private var _mc:Sprite;
		private var _number:Number;
		private var _frameNum:int;
		private var _clockNum:int;
		private var _shakeNum:Number;
		private var _numN:int;
		private var _isL2S:Boolean;
	
		public function TweenShake(mc:Sprite)
		{
			_mc=mc;
			
		}
		
		public function execute() : void
		{
			_shakeNum=10;
			_numN=1;
			init();
		}
		private function init():void
		{
			_frameNum=9;
			_clockNum=1;
			_number=100;
			_mc.addEventListener(Event.ENTER_FRAME,onEnter);
			
		}
		private function onEnter(event:Event):void
		{
			if(_clockNum<_frameNum)
			{
				switch(_clockNum%4)
				{
					case 0:
						_numN=1;
						break;
					case 1:
						_numN=1;
						_shakeNum*=Math.sqrt(_clockNum);
						break;
					case 2:
						_numN=-1;
						break;
					case 3:
						_numN=-1;
						break;
				}
				_mc.y+=_numN*_shakeNum;
				_clockNum++;

			}
			else
			{
				_mc.filters=[];
				_mc.removeEventListener(Event.ENTER_FRAME,onEnter);
			}
		}
		
	}

}