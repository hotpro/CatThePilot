package com.nana.petadventure.component 
{
	import com.nana.petadventure.StartMenu;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import com.nana.petadventure.GameWorld;
	import flash.sampler.NewObjectSample;
	import com.nana.petadventure.StartMenu;
	import mochi.as3.*;

	/**
	 * ...
	 * @author Yanna Wu
	 */
	public class GameOverPanel extends Sprite
	{		
		private var _score:int;
		
		public function GameOverPanel(score:int) 
		{
			_score = score;
			
			this.x = 300;
			this.y = 200;
			this.scoreTXT.text = _score.toString();
			this.returnBTN.addEventListener(MouseEvent.CLICK, returnClickHandler);
			this.submitBTN.addEventListener(MouseEvent.CLICK, onSubmitHandler);
			this.survivalUnlock.visible = false;
			
		}
		
		private function returnClickHandler(e)
		{
			this.parent.removeChild(this);
			StartMenu.instance.visible = true;
			GameWorld.instance.destroy();
		}
		
		private function onSubmitHandler(e)
		{
			if (GameWorld.instance.gameLevel <= 10)
			{
				var o:Object = { n: [5, 0, 6, 8, 9, 15, 8, 12, 11, 11, 15, 0, 8, 5, 2, 5], f: function (i:Number,s:String):String { if (s.length == 16) return s; return this.f(i+1,s + this.n[i].toString(16));}};
				var boardID:String = o.f(0,"");
				MochiScores.showLeaderboard({boardID: boardID, score: _score});
			}else if (GameWorld.instance.gameLevel == 11)
			{
				var o1:Object = { n: [3, 13, 7, 3, 9, 6, 14, 6, 3, 6, 0, 14, 15, 13, 7, 15], f: function (i:Number,s:String):String { if (s.length == 16) return s; return this.f(i+1,s + this.n[i].toString(16));}};
				var boardID1:String = o1.f(0,"");
				MochiScores.showLeaderboard({boardID: boardID1, score: _score});
			}else {
				var o2:Object = { n: [1, 3, 1, 6, 1, 7, 4, 5, 3, 12, 13, 10, 9, 0, 11, 3], f: function (i:Number,s:String):String { if (s.length == 16) return s; return this.f(i+1,s + this.n[i].toString(16));}};
				var boardID2:String = o2.f(0,"");
				MochiScores.showLeaderboard({boardID: boardID2, score: _score});
			}
		}
		
	}

}