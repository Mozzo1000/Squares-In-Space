package com.mozzo.game.Events{
	import flash.events.Event;

	public class NavigationEvent extends Event{
		
		public static const START:String = "start";
		public static const RETURNMENU:String = "returnmenu";
		
		public function NavigationEvent(type:String){
			super(type);
		}
	}
}