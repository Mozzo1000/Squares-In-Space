package com.mozzo.game.Screens{
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import com.mozzo.game.Events.NavigationEvent;
	
	public class EndScreen extends MovieClip{
		public function EndScreen(){
			Mouse.show();
			returnMenuButton.addEventListener(MouseEvent.CLICK, onClickReturnMenu);			
		}
		
		public function onClickReturnMenu(mouseEvent:MouseEvent):void{
			dispatchEvent(new NavigationEvent(NavigationEvent.RETURNMENU));
		}
	}
}