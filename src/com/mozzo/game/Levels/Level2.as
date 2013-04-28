package com.mozzo.game.Levels{
	import com.mozzo.game.Main;
	import flash.events.TimerEvent;
	import com.mozzo.game.Symbols.Platform;
	import com.mozzo.game.CollisionDetection;
	import com.mozzo.game.Levels.Bonus.LevelBonus1;

	public class Level2 extends Main{
		
		public var levelData:LevelData;
		
		public function Level2(){
			super();
			levelData = new LevelData(2);
			player.x = 15;
			player.y = 10;
		}
		
		override public function onTick(event:TimerEvent):void{
			super.onTick(event);
			//trace("LEevel 2");
			
			
			if(levelData.getLevel() == 2){
				goal.x = 75;
				goal.y = 350;
				
				PlatDeath2.visible = false;
				PlatDeath3.visible = false;
				PlatDeath4.visible = false;
				PlatDeath5.visible = false;
				PlatDeath6.visible = false;
				Plat9.visible = false;
				Plat10.visible = false;
				
				/*
				if(CollisionDetection.isColliding(player, bonusGoal, this, true)){
					levelData = new LevelData(levelData.getLevel() + 1);
					this.parent.addChild(new LevelBonus1());
				}
				*/
				
				if(CollisionDetection.isColliding(player, goal, this, true)){
					//trace("Hit Level2");
					levelData = new LevelData(levelData.getLevel() + 1);
					this.parent.addChild(new LevelBonus1());
					this.sfxSoundChannel = nextLevelSound.play();
				}
				
				if(CollisionDetection.isColliding(player, PlatDeath2, this, true) || CollisionDetection.isColliding(player, PlatDeath3, this, true)||
				   CollisionDetection.isColliding(player, PlatDeath4, this, true) || CollisionDetection.isColliding(player, PlatDeath6, this, true)||
				   CollisionDetection.isColliding(player, PlatDeath6, this, true)){
					player.x = 15;
					player.y = 10;
				}
				
				if(CollisionDetection.isColliding(player, Plat9, this, true)){
					if(player.y > Plat9.y){
						player.y = player.y + 6;
					}else if(player.y < Plat9.y){
						player.y = player.y - 1;
					}
					
					if(player.x > Plat9.x){
						//trace(">");
						player.x = player.x + 6;
					}else if(player.x < Plat9.x){
						//trace("<");
						player.x = player.x - 6;
					}
				}
				
				if(CollisionDetection.isColliding(player, Plat10, this, true)){
					if(player.y > Plat10.y){
						//trace("WHHYY!!!");
						player.y = player.y + 6;
					}else if(player.y < Plat10.y){
						player.y = player.y - 1;
					}
					
					if(player.x > Plat10.x){
						//trace(">");
						player.x = player.x + 6;
					}else if(player.x < Plat10.x){
						//trace("<");
						player.x = player.x - 6;
					}
				}
			}
		}
	}
}