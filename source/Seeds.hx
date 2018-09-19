package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;

class Seeds extends FlxSprite
{
	var _randomX:Float;
	var _randomY:Float;

	public function new(?X:Float = 0, ?Y:Float = 0)
	{
		super(X, Y);
		makeGraphic(20, 20, FlxColor.GREEN);
		width = 20;
		height = 20;
		updateHitbox();
	}
	override public function update(elapsed:Float):Void{
		super.update(elapsed);
	}
}