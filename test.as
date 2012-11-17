package  
{
	import com.nana.petadventure.bg.FarView;
	import com.nana.petadventure.GameWorld;
	import com.nana.petadventure.StartMenu;
	import flash.display.*;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.Event;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class test extends Sprite
	{
		public var _mochiads_game_id:String = "5e86eedfa7db8a06";;
		private var menu:StartMenu;
		private var game:GameWorld;
		public var instance:test;
		public var bestAdventureScore:int = 0;
		public var bestSurvivalScore:int = 0;
		public var bestChallengeScore:int = 0;
		
		public function test() 
		{			
			if (this.stage)
            {
                this.initGame();
            }
            else
            {
                this.addEventListener(Event.ADDED_TO_STAGE, this.initGame);
            }
		}
		
		private function initGame(e = null)
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, this.initGame);
			instance = this;
			stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
			menu = new StartMenu();			
			this.addChild(menu);
		}
				
	}

}