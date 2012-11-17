package com.nana.petadventure.component 
{
	import flash.display.MovieClip;
	import com.nana.petadventure.GameWorld;
	import flash.events.MouseEvent;
	import com.nana.petadventure.StartMenu;
	import mochi.as3.*;
	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class AllLevelCompletePanel extends MovieClip
	{
		private var _score:int;
		
		public function AllLevelCompletePanel(score:int) 
		{
			_score = score;
			this.x = 300;
			this.y = 200;
			this.scoreTXT.text = _score.toString();
			this.continueBTN.addEventListener(MouseEvent.CLICK, onContinueHandler);
			this.submitBTN.addEventListener(MouseEvent.CLICK, onSubmitHandler);
		}
		
		private function onContinueHandler(e)
		{
			this.parent.removeChild(this);
			StartMenu.instance.visible = true;
			GameWorld.instance.destroy();
		}
		
		private function onSubmitHandler(e)
		{
			var o:Object = { n: [5, 0, 6, 8, 9, 15, 8, 12, 11, 11, 15, 0, 8, 5, 2, 5], f: function (i:Number,s:String):String { if (s.length == 16) return s; return this.f(i+1,s + this.n[i].toString(16));}};
			var boardID:String = o.f(0,"");
			MochiScores.showLeaderboard({boardID: boardID, score: _score});
		}
	}

}