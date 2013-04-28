package com.mozzo.game{
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import com.mozzo.game.Symbols.*;
	import com.mozzo.game.Levels.*;
	import com.mozzo.game.*;
	import flash.text.TextField;
	import flash.utils.getTimer;
	import flash.media.SoundChannel;
	import flash.ui.Mouse;
	
	public class Main extends MovieClip{
		
		public var timer:Timer;
		public var player:Player;
		public var goal:Goal;
		public var level:Number;
		public var plat:Platform;
		public var currentLevelData:LevelData;
		
		public var nextLevelSound:NextLevelSound;
		public var sfxSoundChannel:SoundChannel;
		
		public var animationState:String = "Idle";
		
		public var time:int;
		public var prevTime:int = 0;
		public var fps:int;
		public var fps_txt:TextField;
		
		public var keyUpPressed:Boolean;
		public var keyDownPressed:Boolean;
		public var keyLeftPressed:Boolean;
		public var keyRightPressed:Boolean;

		
		public function Main(){
			Mouse.hide();
			goal = new Goal();
			plat = new Platform();
			addChild(goal);
						
			player = new Player();
			player.x = 220;
			player.y = 520;
			addChild(player);
			
			fps_txt = new TextField();
			//addChild(fps_txt);
			
			keyUpPressed = false;
			keyDownPressed = false;
			keyLeftPressed = false;
			keyRightPressed = false;
			
			nextLevelSound = new NextLevelSound();
			
			timer = new Timer(25);
			timer.addEventListener(TimerEvent.TIMER, onTick);
			timer.start();
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddStage);
			this.addEventListener(Event.ENTER_FRAME, getFPS);
		}
		
		public function getFPS(event:Event):void{
			time = getTimer();
			fps = 1000/(time-prevTime);
			fps_txt.text = "FPS: " + fps;
			prevTime = getTimer();			
		}
		
		public function onAddStage(event:Event):void{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyReleased);
		}
		
		//Every statement = true
		public function onKeyPressed(event:KeyboardEvent):void{
			if(event.keyCode == Keyboard.UP){
				keyUpPressed = true;
			}else if(event.keyCode == Keyboard.DOWN){
				keyDownPressed = true;
			}else if(event.keyCode == Keyboard.LEFT){
				keyLeftPressed = true;
			}else if(event.keyCode == Keyboard.RIGHT){
				keyRightPressed = true;
			}
			
			if(event.keyCode == Keyboard.W){
				keyUpPressed = true;
			}else if(event.keyCode == Keyboard.S){
				keyDownPressed = true;
			}else if(event.keyCode == Keyboard.A){
				keyLeftPressed = true;
			}else if(event.keyCode == Keyboard.D){
				keyRightPressed = true;
			}
		}
		
		//Every statement = false
		public function onKeyReleased(event:KeyboardEvent):void{
			if(event.keyCode == Keyboard.UP){
				keyUpPressed = false;
				animationState = "Idle";
			}else if(event.keyCode == Keyboard.DOWN){
				keyDownPressed = false;
				animationState = "IdleDown";
			}else if(event.keyCode == Keyboard.LEFT){
				keyLeftPressed = false;
				animationState = "IdleLeft";
			}else if(event.keyCode == Keyboard.RIGHT){
				keyRightPressed = false;
				animationState = "IdleRight";
			}
			
			if(event.keyCode == Keyboard.W){
				keyUpPressed = false;
				animationState = "Idle";
			}else if(event.keyCode == Keyboard.S){
				keyDownPressed = false;
				animationState = "IdleDown";
			}else if(event.keyCode == Keyboard.A){
				keyLeftPressed = false;
				animationState = "IdleLeft";
			}else if(event.keyCode == Keyboard.D){
				keyRightPressed = false;
				animationState = "IdleRight";
			}
		}
		
		public function onTick(event:TimerEvent):void{
			
			if(player.currentLabel != animationState){
				player.gotoAndStop(animationState);
			}
			
			player.y += 1.0;
			
			if(player.x < (player.width / 2 - 25)){
				player.x = player.width / 2 - 25;
			}
			if(player.x > 775 - (player.width / 2)){
				player.x = 775 - (player.width / 2);
			}
			
			if(player.y < (player.height / 2 - 25)){
				player.y = player.height / 2 - 25;
			}
			if(player.y > 575 - (player.height / 2)){
				player.y = 575 - (player.height / 2);
			}
			
			if(keyUpPressed){
				player.moved(0, -1);
				animationState = "MoveUp";
			}else if(keyDownPressed){
				player.moved(0, 1);
				animationState = "MoveDown";
			}else if(keyLeftPressed){
				player.moved(-1, 0);
				animationState = "MoveLeft";
			}else if(keyRightPressed){
				player.moved(1, 0);
				animationState = "MoveRight";
			}
		}
	}
}