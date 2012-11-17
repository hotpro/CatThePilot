package com.nana.petadventure 
{
	import com.nana.petadventure.event.GameEvent;
	import com.nana.petadventure.utils.SoundManager;
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.events.*;
	import com.nana.petadventure.sound.*;
	import mochi.as3.*;

	/**
	 * 单例，游戏开始界面，处理几个按钮事件
	 * ...
	 * @author Yanna Wu
	 */
	public class StartMenu extends Sprite
	{
		public var isSpecial:Boolean = false;
		public var isSurvival:Boolean = false;
		public var isHalloween:Boolean = false;
		public var isSound:Boolean = true;
		public static var instance:StartMenu;
		public var game:GameWorld;
		public var sound:SoundManager;
		public var curLevel:int;
		
		public function StartMenu() 
		{
			instance = this;
			curLevel = 1;
			if (stage)
            {
                init(null);
            }
            else
            {
                this.addEventListener(Event.ADDED_TO_STAGE, init);
            }			
		}
		
		private function init(e)
		{
			game = new GameWorld();
			stage.addChildAt(game, 0);
			var rectmask = new Shape();
			rectmask.graphics.beginFill(11180339);
			rectmask.graphics.drawRect(0,0,600,400);
			rectmask.graphics.endFill();			
			game.mask = rectmask;
			sound = new SoundManager();
			initSound();
			this.startBTN.addEventListener(MouseEvent.CLICK, startClickHandler);
			this.score1BTN.addEventListener(MouseEvent.CLICK, score1ClickHandler);
			this.score2BTN.addEventListener(MouseEvent.CLICK, score2ClickHandler);
			this.score3BTN.addEventListener(MouseEvent.CLICK, score3ClickHandler);
			this.soundBTN.addEventListener(MouseEvent.CLICK, soundClickHandler);
			this.specialLOCK.visible = !isSpecial;
			this.specialBTN.visible = isSpecial;
			this.survivalLOCK.visible = !isSurvival;
			this.survivalBTN.visible = isSurvival;
			if (isSpecial)
			{
				this.specialBTN.addEventListener(MouseEvent.CLICK, specialClickHandler);
			}
			if (isSurvival)
			{				
				this.survivalBTN.addEventListener(MouseEvent.CLICK, survivalClickHandler);
			}
			MochiServices.connect("5e86eedfa7db8a06", root);
			
		}
		
		public function unlockChallengeMode() : void
		{
			isSpecial = true;
			this.specialLOCK.visible = false;
			this.specialBTN.visible = true;
			this.specialBTN.addEventListener(MouseEvent.CLICK, specialClickHandler);
			
		}
		
		public function unlockSurvivalMode() : void
		{
			isSurvival = true;
			this.survivalLOCK.visible = false;
			this.survivalBTN.visible = true;
			this.survivalBTN.addEventListener(MouseEvent.CLICK, survivalClickHandler);
		}
		
		public function changeCurrentLevel(lv:int) : void
		{
			curLevel = lv;
			this.levelTXT.text = "Level " + curLevel.toString();
		}
		
		private function initSound() : void
		{
			sound.addSound("propeller", new SoundPropeller());
			sound.addSound("explode", new SoundExplode());
			sound.addSound("hit", new SoundHit());
			sound.addSound("shoot", new SoundShoot());
			sound.addSound("speedup", new SoundSpeedUp());
			sound.addSound("groan", new SoundGroan());
		}
		
		private function startClickHandler(e:MouseEvent)
		{
			e.stopPropagation();
			this.visible = false;
			
			game.gameLevel = curLevel;
			game.init();
		}
		
		private function score3ClickHandler(e:MouseEvent)
		{
			var o:Object = { n: [1, 3, 1, 6, 1, 7, 4, 5, 3, 12, 13, 10, 9, 0, 11, 3], f: function (i:Number,s:String):String { if (s.length == 16) return s; return this.f(i+1,s + this.n[i].toString(16));}};
			var boardID:String = o.f(0,"");
			MochiScores.showLeaderboard({boardID: boardID});
		}
		
		private function score2ClickHandler(e:MouseEvent)
		{
			var o:Object = { n: [3, 13, 7, 3, 9, 6, 14, 6, 3, 6, 0, 14, 15, 13, 7, 15], f: function (i:Number,s:String):String { if (s.length == 16) return s; return this.f(i+1,s + this.n[i].toString(16));}};
			var boardID:String = o.f(0,"");
			MochiScores.showLeaderboard({boardID: boardID});
		}
		
		private function score1ClickHandler(e:MouseEvent)
		{
			var o:Object = { n: [5, 0, 6, 8, 9, 15, 8, 12, 11, 11, 15, 0, 8, 5, 2, 5], f: function (i:Number,s:String):String { if (s.length == 16) return s; return this.f(i+1,s + this.n[i].toString(16));}};
			var boardID:String = o.f(0,"");
			MochiScores.showLeaderboard({boardID: boardID});
		}
		
		private function soundClickHandler(e:MouseEvent)
		{
			this.sound.muteSound();
			isSound = !isSound;
			if (isSound)
			{
				this.soundBTN.gotoAndStop("sound");
			}else
			{
				this.soundBTN.gotoAndStop("mute");
			}
			
		}
		
		private function specialClickHandler(e:MouseEvent)
		{
			this.visible = false;
			game.gameLevel = 11;
			game.init();
		}
		
		private function survivalClickHandler(e:MouseEvent)
		{
			this.visible = false;
			game.gameLevel = 12;
			game.init();
		}
	}

}