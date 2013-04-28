package com.mozzo.game.Levels{
	import com.mozzo.game.Main;
	import flash.events.TimerEvent;
	import com.mozzo.game.Symbols.Platform;
	import com.mozzo.game.CollisionDetection;
	import flash.display.*;
	import com.mozzo.game.Events.*;

	public class Level1 extends Main{
		
		public var levelData:LevelData;
		
		public function Level1(){
			super();
			levelData = new LevelData(1);
		}
		
		override public function onTick(event:TimerEvent):void{
			super.onTick(event);
			if(levelData.getLevel() == 1){
				goal.x = 425;
				goal.y = 300;
				
				if(CollisionDetection.isColliding(player, goal, this, true)){
					//trace("Hit Level1");
					levelData = new LevelData(levelData.level + 1);
					//trace(levelData.level);
					this.sfxSoundChannel = nextLevelSound.play();
					
					this.parent.addChild(new Level2());
				}
				
				Plat1.visible = false;
				Plat2.visible = false;
				Plat3.visible = false;
				Plat4.visible = false;
				Plat5.visible = false;
				Plat6.visible = false;
				Plat7.visible = false;
				Plat8.visible = false;
				PlatDeath1.visible = false;
				
				if(CollisionDetection.isColliding(player, PlatDeath1, this, true)){
					player.x = 220;
					player.y = 520;
				}
				
				//This is in no way dymanic, need to re-write this every time a new platform is in stage.
				if(CollisionDetection.isColliding(player, Plat1, this, true)){
					if(player.y > Plat1.y){
						player.y = player.y + 6;
					}else if(player.y < Plat1.y){
						player.y = player.y - 1;
					}
					
					if(player.x > Plat1.x){
						//trace(">");
						player.x = player.x + 6;
					}else if(player.x < Plat1.x){
						//trace("<");
						player.x = player.x - 6;
					}
				}
				
				//Any horozontal line will "kill" the player, maybe...
				if(CollisionDetection.isColliding(player, Plat2, this, true)){
					if(player.y > Plat2.y){
						//trace("WHHYY!!!");
						player.y = player.y + 6;
					}else if(player.y < Plat2.y){
						player.y = player.y - 1;
					}
					
					if(player.x > Plat2.x){
						//trace(">");
						player.x = player.x + 6;
					}else if(player.x < Plat2.x){
						//trace("<");
						player.x = player.x - 6;
					}
				}
				
				if(CollisionDetection.isColliding(player, Plat3, this, true)){
					if(player.y > Plat3.y){
						player.y = player.y + 6;
					}else if(player.y < Plat3.y){
						player.y = player.y - 1;
					}
					
					if(player.x > Plat3.x){
						//trace(">");
						player.x = player.x + 6;
					}else if(player.x < Plat3.x){
						//trace("<");
						player.x = player.x - 6;
					}
				}
				
				if(CollisionDetection.isColliding(player, Plat4, this, true)){
					if(player.y > Plat4.y){
						player.y = player.y + 6;
					}else if(player.y < Plat4.y){
						player.y = player.y - 1;
					}
					
					if(player.x > Plat4.x){
						//trace(">");
						player.x = player.x + 6;
					}else if(player.x < Plat4.x){
						//trace("<");
						player.x = player.x - 6;
					}
				}
				
				if(CollisionDetection.isColliding(player, Plat5, this, true)){
					if(player.y > Plat5.y){
						player.y = player.y + 6;
					}else if(player.y < Plat5.y){
						player.y = player.y - 1;
					}
					
					if(player.x > Plat5.x){
						//trace(">");
						player.x = player.x + 6;
					}else if(player.x < Plat5.x){
						//trace("<");
						player.x = player.x - 6;
					}
				}
				
				if(CollisionDetection.isColliding(player, Plat6, this, true)){
					if(player.y > Plat6.y){
						player.y = player.y + 6;
					}else if(player.y < Plat6.y){
						player.y = player.y - 1;
					}
					
					if(player.x > Plat6.x){
						//trace(">");
						player.x = player.x + 6;
					}else if(player.x < Plat6.x){
						//trace("<");
						player.x = player.x - 6;
					}
				}
				
				if(CollisionDetection.isColliding(player, Plat7, this, true)){
					if(player.y > Plat7.y){
						player.y = player.y + 6;
					}else if(player.y < Plat7.y){
						player.y = player.y - 1;
					}
					
					if(player.x > Plat7.x){
						//trace(">");
						player.x = player.x + 6;
					}else if(player.x < Plat7.x){
						//trace("<");
						player.x = player.x - 6;
					}
				}
				
				if(CollisionDetection.isColliding(player, Plat8, this, true)){
					if(player.y > Plat8.y){
						player.y = player.y + 6;
					}else if(player.y < Plat8.y){
						player.y = player.y - 1;
					}
					
					if(player.x > Plat8.x){
						//trace(">");
						player.x = player.x + 6;
					}else if(player.x < Plat8.x){
						//trace("<");
						player.x = player.x - 6;
					}
				}
			}
		}
	}
}