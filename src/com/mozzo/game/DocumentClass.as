package com.mozzo.game{
	import flash.display.MovieClip;
	import com.mozzo.game.Main;
	import com.mozzo.game.Levels.*;
	import com.mozzo.game.Levels.Bonus.*;
	import com.mozzo.game.Screens.MenuScreen;
	import com.mozzo.game.Events.*;
	import flash.events.Event;
	import flash.media.SoundChannel;
	import com.mozzo.game.Screens.EndScreen;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import com.mozzo.game.Screens.SplashScreen;

	public class DocumentClass extends MovieClip{
		
		public var stage1:Level1;
		public var stage2:Level2;
		public var stage1Bonus:LevelBonus1;
		public var levelData:LevelData;
		public var menuScreen:MenuScreen;
		public var endScreen:EndScreen;
		public var main:Main;
		public var splashScreen:SplashScreen;
		
		private var timer:Timer = new Timer(4000);
		
		public var backgroundMusic:BackgroundMusic;
		public var bgmSoundChannel:SoundChannel;
		
		public function DocumentClass(){
			
			levelData = new LevelData(0);
			
			backgroundMusic = new BackgroundMusic();
			
			if(levelData.getLevel() == 0){
				timer.addEventListener(TimerEvent.TIMER, splashScreenEnd);
				timer.start();
				showSplashScreen();
				//showMenu();
			}else if(levelData.getLevel() == 1){
				Stage1();
			}else if(levelData.getLevel() == 2){
				Stage2();
			}else if(levelData.getLevel() == 3){
				Stage1Bonus();
			}else if(levelData.getLevel() == 4){
				showEndScreen();
			}
			
			stage.stageFocusRect = false;
		}
		
		
		public function splashScreenEnd(event:TimerEvent):void{
			timer.removeEventListener(TimerEvent.TIMER, splashScreenEnd);
			timer.stop();
			splashScreen = null;
			showMenu();
		}
		
		public function showSplashScreen():void{
			splashScreen = new SplashScreen();
			splashScreen.x = 0;
			splashScreen.y = 0;
			addChild(splashScreen);
		}
		
		public function onBackgroundMusicFinished(event:Event):void{
			bgmSoundChannel = backgroundMusic.play();
			bgmSoundChannel.addEventListener(Event.SOUND_COMPLETE, onBackgroundMusicFinished);
		}
		
		public function showMenu():void{
			menuScreen = new MenuScreen();
			menuScreen.addEventListener(NavigationEvent.START, onRequestStart);
			menuScreen.x = 0;
			menuScreen.y = 0;
			addChild(menuScreen);
		}
		
		public function onRequestStart(navigationEvent:NavigationEvent):void{
			Stage1();
			removeChild(menuScreen);
			menuScreen = null;
		}
		
		public function showEndScreen():void{
			endScreen = new EndScreen();
			endScreen.addEventListener(NavigationEvent.RETURNMENU, onRequestReturnMenu);
			endScreen.x = 0;
			endScreen.y = 0;
			addChild(endScreen);
		}
		
		public function onRequestReturnMenu(navigationEvent:NavigationEvent):void{
			trace("sdsds");
			showMenu();
			removeChild(endScreen);
			endScreen = null;
		}
		
		public function Stage1():void{
			stage1 = new Level1();
			stage1.x = 0;
			stage1.y = 0;
			addChild(stage1);
			stage.focus = stage1;
			
			bgmSoundChannel = backgroundMusic.play();
			bgmSoundChannel.addEventListener(Event.SOUND_COMPLETE, onBackgroundMusicFinished);
		}
		
		public function Stage2():void{
			stage2 = new Level2();
			stage2.x = 0;
			stage2.y = 0;
			addChild(stage2);
		}
		
		public function Stage1Bonus():void{
			stage1Bonus = new LevelBonus1();
			stage1Bonus.x = 0;
			stage1Bonus.y = 0;
			addChild(stage1Bonus);
		}
	}
}