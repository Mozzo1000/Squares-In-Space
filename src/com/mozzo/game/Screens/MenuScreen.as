package com.mozzo.game.Screens{
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import com.mozzo.game.Events.NavigationEvent;
	
	public class MenuScreen extends MovieClip{
		public function MenuScreen(){
			Mouse.show();
			startButton.addEventListener(MouseEvent.CLICK, onClickStart);			
		}
		
		public function onClickStart(mouseEvent:MouseEvent):void{
			dispatchEvent(new NavigationEvent(NavigationEvent.START));
		}
	}
}