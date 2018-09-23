package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;

class Seeds extends FlxSprite
{	public var grpSeeds:FlxTypedGroup<Seeds>;
	var speed:Float = 125;
	var Direction:Float;
	var lifeSpan:Float = 1;
	public function new(?X:Float = 0, ?Y:Float = 0, ?D:Float = 0,?S:FlxTypedGroup<Seeds>)
	{
		super(X, Y);
		makeGraphic(5, 5, FlxColor.GREEN);
		width = 5;
		height = 5;
		grpSeeds = S;
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
		if (lifeSpan<=0){
			destroy();
		}
	}

	override public function destroy():Void{
		//spawnMonster
		grpSeeds.remove(this);
		super.destroy();
		
	}
}