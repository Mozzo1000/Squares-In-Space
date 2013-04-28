package com.mozzo.game.Levels.Bonus{
	import com.mozzo.game.Main;
	import flash.events.TimerEvent;
	import com.mozzo.game.CollisionDetection;
	import com.mozzo.game.Levels.LevelData;
	import com.mozzo.game.Levels.Level2;
	import com.mozzo.game.Events.*;
	import com.mozzo.game.Screens.EndScreen;

	public class LevelBonus1 extends Main{
		
		public var levelData:LevelData;
		
		public function LevelBonus1(){
			super();
			levelData = new LevelData(3);
			goal.x = 220;
			goal.y = 520;
			player.x = 600;
			player.y = 30;			
		}
		
		override public function onTick(event:TimerEvent):void{
			super.onTick(event);
			
			if(levelData.getLevel() == 3){
				
				PlatDeath7.visible = false;
				PlatDeath8.visible = false;
				PlatDeath9.visible = false;
				Plat11.visible = false;
				Plat12.visible = false;
				Plat13.visible = false;
				
					if(CollisionDetection.isColliding(player, goal, this, true)){
					levelData = new LevelData(levelData.getLevel() + 1);
					this.parent.addChild(new EndScreen());
					this.sfxSoundChannel = nextLevelSound.play();
				}
				
				if(CollisionDetection.isColliding(player, PlatDeath7, this, true) || CollisionDetection.isColliding(player, PlatDeath8, this, true)||
				   CollisionDetection.isColliding(player, PlatDeath9, this, true)){
					player.x = 600
					player.y = 30;
				}
				
				if(CollisionDetection.isColliding(player, Plat11, this, true)){
					if(player.y > Plat11.y){
						player.y = player.y + 6;
					}else if(player.y < Plat11.y){
						player.y = player.y - 1;
					}
					
					if(player.x > Plat11.x){
						//trace(">");
						player.x = player.x + 6;
					}else if(player.x < Plat11.x){
						//trace("<");
						player.x = player.x - 6;
					}
				}
				
				if(CollisionDetection.isColliding(player, Plat12, this, true)){
					if(player.y > Plat12.y){
						player.y = player.y + 6;
					}else if(player.y < Plat12.y){
						player.y = player.y - 1;
					}
					
					if(player.x > Plat12.x){
						//trace(">");
						player.x = player.x + 6;
					}else if(player.x < Plat12.x){
						//trace("<");
						player.x = player.x - 6;
					}
				}
				
				if(CollisionDetection.isColliding(player, Plat13, this, true)){
					if(player.y > Plat13.y){
						player.y = player.y + 6;
					}else if(player.y < Plat13.y){
						player.y = player.y - 1;
					}
					
					if(player.x > Plat13.x){
						//trace(">");
						player.x = player.x + 6;
					}else if(player.x < Plat13.x){
						//trace("<");
						player.x = player.x - 6;
					}
				}
			}
		}
	}
}