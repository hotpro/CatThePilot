package com.nana.petadventure.event 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class GameEvent extends Event
	{
		public static const START_GAME:String = "startGame";
		public static const SPEED_UP:String = "speedUp";
		public static const ENEMY_UP:String = "enemyUp;"
		
		public function GameEvent(type:String) 
		{
			super(type);
		}
		
	}

}