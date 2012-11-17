package com.nana.petadventure 
{
	import com.nana.petadventure.bg.BgAsset;
	import com.nana.petadventure.bg.BgBase;
	import com.nana.petadventure.bg.BgMask;
	import com.nana.petadventure.bg.StaticView;
	import com.nana.petadventure.bonus.BonusCtrl;
	import com.nana.petadventure.component.AllLevelCompletePanel;
	import com.nana.petadventure.component.ExplodeEffect;
	import com.nana.petadventure.component.FireEffect;
	import com.nana.petadventure.component.GameOverPanel;
	import com.nana.petadventure.component.GuidePanel;
	import com.nana.petadventure.component.InfoPanel;
	import com.nana.petadventure.enemy.EnemyCtrl;
	import com.nana.petadventure.event.GameEvent;
	import com.nana.petadventure.pet.Cat;
	import com.nana.petadventure.sound.SoundExplode;
	import com.nana.petadventure.sound.SoundGroan;
	import com.nana.petadventure.sound.SoundHit;
	import com.nana.petadventure.sound.SoundPropeller;
	import com.nana.petadventure.sound.SoundShoot;
	import com.nana.petadventure.sound.SoundSpeedUp;
	import com.nana.petadventure.tween.TweenShake;
	import com.nana.petadventure.tween.TweenZoomOut;
	import com.nana.petadventure.utils.SoundManager;
	import com.nana.petadventure.weapon.BulletBase;
	import com.nana.petadventure.weapon.BulletCtrl;
	import com.nana.petadventure.weapon.NormalBullet;
	import flash.display.*;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	import flash.ui.Keyboard;
	import com.nana.petadventure.component.HitEffect;
	
	/**
	 * 
	 * 单例，游戏主场景，调用init()初始化游戏
	 * ...
	 * @author Yanna Wu
	 */
	public class GameWorld extends Sprite
	{
		public static var instance:GameWorld;
		public var pet:Cat;
		private var _gameTimer:Timer;
		public var curBullet:String;
		private var _enemyCtrl:EnemyCtrl;
		private var _bonusCtrl:BonusCtrl;
		public var bulletCtrl:BulletCtrl;
		private var _isFly:Boolean;
		private var _cntdown:int;
		private var _cntup:int;
		private var _distance:int;
		private var _bg:BgAsset;
		public var bgSpeed:Number;
		public var info:InfoPanel;
		private var _gameOver:GameOverPanel;
		public var enemyarr:Array;
		public var bonusarr:Array;
		public var bulletarr:Array;
		public var fire:FireEffect;
		private var _explode:ExplodeEffect;
		public var bgLayer:Sprite;
		public var enemyLayer:Sprite;
		public var bonusLayer:Sprite;
		public var bulletLayer:Sprite;
		public var effectLayer:Sprite;
		
		private var _tweenZoomOut:TweenZoomOut;
		public var tweenShake:TweenShake;
		
		public var gameLevel:int;
		private var _guide:GuidePanel;
		public var score:int = 0;
		private var _completePanel:AllLevelCompletePanel;
		private var _bgStatic:StaticView;
		public var isLevelFinished:Boolean;
		private var petspeedX:int;	//用于levevl complete效果
		private	var petDistanceY:int;	//用于levevl complete效果
		public var frameCount:int;
		
		public function GameWorld() 
		{
			instance = this;
			gameLevel = 1;
		}
		
		//初始化场景
		public function init() : void
		{			
			_bgStatic = new StaticView();
			info = new InfoPanel();
			_bg = new BgAsset();
			bgLayer = new Sprite;
			enemyLayer = new Sprite;
			bonusLayer = new Sprite;
			bulletLayer = new Sprite;
			effectLayer = new Sprite;
			_tweenZoomOut = new TweenZoomOut(this);
			tweenShake = new TweenShake(this);
			_guide = new GuidePanel();
			this.addChild(bgLayer);
			this.addChild(enemyLayer);
			this.addChild(bonusLayer);
			this.addChild(bulletLayer);
			this.addChild(effectLayer);
			this.addChild(info);
			this.addChild(_guide);
			info.hpbar.hpline.width = 100;
			this.bgLayer.addChild(_bgStatic);
			this.bgLayer.addChild(_bg);
			
			pet = new Cat();
			this._bg.addChildAt(pet,2);
			start();
		}		
		
		
		private function start() : void
		{			
			pet.gotoAndPlay("ready2fly");
			pet.x = 480;
			pet.y = 200;
			waiting();
			_guide.showPanel(gameLevel);
		}
		
		private function bgFrameHandler(e)
		{
			_bg.bgMove(bgSpeed);
		}
		
		public function waiting() : void
		{
			_guide.addEventListener("startFlying", startFlying);
		}
		
		private function startFlying(e) : void
		{
			trace("num:",this.numChildren);
			this.bulletarr = [];
			this.enemyarr = [];
			this.bonusarr = [];
			_distance = 0;
			_isFly = false;
			_cntdown = 0;
			_cntup = 0;
			frameCount = 0;
			pet.gotoAndStop("normal");
			fire = new FireEffect();
			_explode = new ExplodeEffect();
			this.effectLayer.addChild(_explode);
			this.effectLayer.addChild(fire);
			curBullet = "normal";
			_enemyCtrl = new EnemyCtrl(gameLevel);
			if (gameLevel != 11)
			{
				_bonusCtrl = new BonusCtrl(gameLevel);
				bulletCtrl = new BulletCtrl();
			}			
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			this.addEventListener(Event.ENTER_FRAME, onFrameHandler);
			this.addEventListener(Event.ENTER_FRAME, bgFrameHandler);
			bgSpeed = BgBase.SPEED_NORMAL;
			isLevelFinished = false;
		}
		
		private function mouseDownHandler(e)
		{
			_isFly = true;
			_cntdown = 0;
		}
		
		private function mouseUpHandler(e)
		{
			_isFly = false;
			_cntup = 0;
		}
		
		private function onFrameHandler(e:Event)
		{
			frameCount += 1;
			_distance += bgSpeed;
			this.info.distanceTXT.text = _distance.toString()+"m";
			
			if (frameCount == 30 || frameCount == 300 || frameCount == 600 || frameCount == 900 || frameCount == 1500 || frameCount == 2500)
			{
				_enemyCtrl.dispatchEvent(new Event("enemyUp"));
			}
			
			if (gameLevel != 11 && gameLevel != 12)
			{
				if (_distance >= 1500 + gameLevel * 120 && isLevelFinished)
				{
					finishLevelEffect();
				}else if (_distance >= 1500 + gameLevel * 120 - 200 && !isLevelFinished)
				{
					finishingLevel();
					isLevelFinished = true;
				}
			}
			
			if (_distance < 10)
			{
				pet.y -= 0;
			}
			else if (!_isFly)
			{
				pet.y += _cntdown * 0.8;
				_cntdown++;
			}else
			{
				pet.y -= _cntup * 0.8;
				_cntup++;
			}			
			hitTest();			
			if (pet.y >= 300)
			{
				pet.y = 300;
				pet.reduceHp(1);
				bgSpeed = BgBase.SPEED_SLOW;
				pet.petStatus("water");
				pet.isInvinciblity = false;
				this.info.speedUpTimeline.visible = false;
				this.info.shieldTimeline.visible = false;
			}else if (pet.y <= 100)
			{
				pet.y = 100;
				pet.reduceHp(1);
				bgSpeed = BgBase.SPEED_SLOW;
				pet.petStatus("cloud");
				pet.isInvinciblity = false;
				this.info.speedUpTimeline.visible = false;
				this.info.shieldTimeline.visible = false;
			}else if (bgSpeed != BgBase.SPEED_QUICK)
			{
				bgSpeed = BgBase.SPEED_NORMAL;
				pet.petStatus("normal");
			}
			
			
		}
		
		private function hitTest() : void
		{			
			hitEnemy();
			if (gameLevel != 11)
			{
				hitBonus();
			}
			
		}
		
		private function hitEnemy() : void
		{
			for (var i:int = 0; i < enemyarr.length; i++)
			{
				if (pet.hitTestObject(enemyarr[i]))
				{
					
					var hiteffect:HitEffect;
					hiteffect = new HitEffect();
					hiteffect.addEffect(1, this.effectLayer, (pet.x + enemyarr[i].x) / 2, (pet.y + enemyarr[i].y) / 2);
					tweenShake.execute();
					StartMenu.instance.sound.playSound("hit");
					pet.reduceHp(enemyarr[i].attack);					
					this.enemyLayer.removeChild(enemyarr[i]);
					enemyarr[i] = null;
					enemyarr.splice(i, 1);					
				}else if (enemyarr[i].x > 700)
				{
					this.enemyLayer.removeChild(enemyarr[i]);
					enemyarr[i] = null;
					enemyarr.splice(i, 1);
					
				}else
				{
					for ( var j:int = 0; j < bulletarr.length; j++)
					{
						if (bulletarr[j].hitTestObject(enemyarr[i]))
						{
							if (enemyarr[i].reduceHp(bulletarr[j].attack))
							{
								var hiteffect2:HitEffect;
								hiteffect2 = new HitEffect();
								hiteffect2.addEffect(1.2, this.effectLayer, enemyarr[i].x, enemyarr[i].y);
								_explode.showEffect(0xFF0000, new Point(enemyarr[i].x, enemyarr[i].y));
								StartMenu.instance.sound.playSound("explode");
								this.enemyLayer.removeChild(enemyarr[i]);
								enemyarr[i] = null;
								enemyarr.splice(i, 1);
							}
							this.bulletLayer.removeChild(bulletarr[j]);
							bulletarr[j] = null;
							bulletarr.splice(j, 1);
						}
						else if (bulletarr[j].x < 0)
						{
							this.bulletLayer.removeChild(bulletarr[j]);
							bulletarr[j] = null;
							bulletarr.splice(j, 1);
						}
					}
				}
			}
		}
		
		public function canonExplode() : void
		{
			for (var k:int = 0; k < this.enemyarr.length; k++)
			{
				tweenShake.execute();
				var hiteffect:HitEffect;
				hiteffect = new HitEffect();
				hiteffect.addEffect(1.2, this.effectLayer, enemyarr[k].x, enemyarr[k].y);
				_explode.showEffect(0xFF0000, new Point(enemyarr[k].x, enemyarr[k].y));
				StartMenu.instance.sound.playSound("explode");
				this.enemyLayer.removeChild(enemyarr[k]);
				enemyarr[k] = null;
				enemyarr.splice(k, 1);
			}
		}
		
		private function hitBonus() : void
		{
			for (var k:int = 0; k < bonusarr.length; k++)
			{
				if (pet.hitTestObject(bonusarr[k]))
				{
					bonusarr[k].bonusResult();					
					this.bonusLayer.removeChild(bonusarr[k]);
					bonusarr[k] = null;
					bonusarr.splice(k, 1);					
				}else if (bonusarr[k].x > 700)
				{
					this.bonusLayer.removeChild(bonusarr[k]);
					bonusarr[k] = null;
					bonusarr.splice(k, 1);
				}
			}
		}
		
		public function gameOver() : void
		{
			StartMenu.instance.sound.playSound("groan");
			this.removeEventListener(Event.ENTER_FRAME, onFrameHandler);
			this.removeEventListener(Event.ENTER_FRAME, bgFrameHandler);
			this.removeChild(this.enemyLayer);
			this.removeChild(this.bulletLayer);
			this.removeChild(this.bonusLayer);
			this.removeChild(this.effectLayer);
			this.enemyLayer = null;
			this.bulletLayer = null;
			this.bonusLayer = null;
			this.effectLayer = null;
			this._bg.removeChild(pet);
			if (_enemyCtrl)
			{
				_enemyCtrl.destroy();
				_enemyCtrl = null;
			}
			if (bulletCtrl)
			{
				bulletCtrl.destroy();
				bulletCtrl = null;
			}
			
			if (_bonusCtrl)
			{
				_bonusCtrl.destroy();
				_bonusCtrl = null;
			}			
			//bulletCtrl.destroy();
			if (gameLevel != 11 && gameLevel != 12)
			{
				score += _distance;
				score = score / 10;
				_gameOver = new GameOverPanel(score);
				
			}else
			{
				_gameOver = new GameOverPanel(_distance);
				if (gameLevel == 11 && _distance >= 5000 && !StartMenu.instance.isSurvival)
				{
					StartMenu.instance.unlockSurvivalMode();
					_gameOver.survivalUnlock.visible = true;
				}else
				{
					_gameOver.survivalUnlock.visible = false;
				}
			}
			
			addChild(_gameOver);
		}
		
		public function levelUp() : void
		{
			if (gameLevel < 10)
			{
				gameLevel += 1;
				StartMenu.instance.changeCurrentLevel(gameLevel);
				start();
			}else
			{
				completeAllLevels();
			}			
		}
		
		//过关过渡
		private function finishingLevel() : void
		{
			_enemyCtrl.destroy();
			_enemyCtrl = null;
			_bonusCtrl.destroy();
			_bonusCtrl = null;
			bulletCtrl.destroy();
			bulletCtrl = null;
		}
		
		//过关动画
		private function finishLevelEffect() : void
		{
			this.removeEventListener(Event.ENTER_FRAME, onFrameHandler);
			this.removeEventListener(Event.ENTER_FRAME, bgFrameHandler);
			this.addEventListener(Event.ENTER_FRAME, onFinishFrameHandler);
			this.score += _distance;
			petspeedX = 2;				
		}
		
		private function onFinishFrameHandler(e) 
		{
			petDistanceY = 200 - pet.y;
			if (pet.x > -100)
			{
				pet.x -= petspeedX;
				petspeedX += 1;
				if (petDistanceY < 0)
				{
					pet.y -= 1;
				}else
				{
					pet.y += 1;
				}
			}else
			{
				this.removeEventListener(Event.ENTER_FRAME, onFinishFrameHandler);
				levelUp();
			}
		}		
		
			
		private function completeAllLevels() : void
		{
			_completePanel = new AllLevelCompletePanel(score);
			this.addChild(_completePanel);
			StartMenu.instance.unlockChallengeMode();
			StartMenu.instance.changeCurrentLevel(1);
		}
		
		public function destroy() : void
		{
			if (bgLayer)
			{
				this.removeChild(bgLayer);
				bgLayer = null;
			}
			if (enemyLayer)
			{
				this.removeChild(enemyLayer);
				enemyLayer = null;
			}
			if (bonusLayer)
			{
				this.removeChild(bonusLayer);
				bonusLayer = null;
			}
			if (bulletLayer)
			{
				this.removeChild(bulletLayer);
				bulletLayer = null;
			}
			if (effectLayer)
			{
				this.removeChild(effectLayer);
				effectLayer = null;
			}
			if (info)
			{
				this.removeChild(info);
				info = null;
			}
			if (_guide)
			{
				this.removeChild(_guide);
				_guide = null;
			}
		}		
	}
}