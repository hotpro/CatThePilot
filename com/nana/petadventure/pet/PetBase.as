package com.nana.petadventure.pet 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class PetBase extends MovieClip
	{
		public var hp:int;
		public var speed:int;
		public var isInvinciblity:Boolean;
		
		public function PetBase() 
		{
			isInvinciblity = false;
		}
		
	}

}
