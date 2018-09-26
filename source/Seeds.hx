package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;

class Seeds extends FlxSprite
{	public var grpSeeds:FlxTypedGroup<Seeds>;
	public var foreGrnd:FlxGroup;
	
	public var grpMons:FlxTypedGroup<Enemy>;
	var speed:Float = 125;
	var mon:Enemy;
	var Direction:Int;
	var monsterDelay:Float = .5;
	var lifeSpan:Float = .6;
	var level:Int;
	public function new(?X:Float = 0, ?Y:Float = 0, ?D:Int = 0,?S:FlxTypedGroup<Seeds>,?M:FlxTypedGroup<Enemy>,?F:FlxGroup)
	{
		super(X, Y);
		makeGraphic(5, 5, FlxColor.BLACK);
		width = 5;
		height = 5;
		grpSeeds = S;
		grpMons = M;
		foreGrnd = F;
		Direction = D;
		updateHitbox();
	}
	override public function update(elapsed:Float):Void{
		super.update(elapsed);
		lifeSpan -= FlxG.elapsed;
		if (Direction == 0){
			velocity.x = -speed;
		}
		else if (Direction == 2){
			velocity.y = -speed;
		}
		else if( Direction ==1 ){
			velocity.x = speed;
		}
		if (lifeSpan <= 0){
			velocity.x = 0;
			velocity.y = 0;
			monsterDelay -= elapsed;
		}
		if (monsterDelay <= 0){
			SpawnMonster();
			grpSeeds.remove(this);
			destroy();
		}
	}
	function SpawnMonster():Void{
		if (this.overlaps(foreGrnd)){
			if(Direction==0)
				mon = new Enemy(this.x - 25, this.y - 20, Direction, grpMons, 0);
			else if(Direction == 1){
				mon = new Enemy(this.x - 25, this.y - 20, Direction, grpMons, 1);
				
			}
			else if (Direction == 2){
				mon = new Enemy(this.x - 25, this.y - 20, Direction, grpMons, 2);
			}
			grpMons.add(mon);
		}
	}
	override public function destroy():Void{
		super.destroy();
		
	}
}