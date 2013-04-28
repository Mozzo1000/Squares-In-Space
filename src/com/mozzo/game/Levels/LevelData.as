package com.mozzo.game.Levels{
	public class LevelData{
		
		public var level:Number;
		
		public function LevelData(levelNum):void{
			level = levelNum;
		}
		
		public function getLevel():Number{
			return level;
		}
	}
}