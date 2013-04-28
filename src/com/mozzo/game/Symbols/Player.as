package com.mozzo.game.Symbols{
	import flash.display.MovieClip;

	public class Player extends MovieClip{
		
		public var speedY:Number = 6;
		public var speedX:Number = 6;
		
		public function Player(){
			
		}
		
		public function moved(xDistance, yDistance):void{			
			x += (xDistance * speedX);
			y += (yDistance * speedY);
		}
	}
}