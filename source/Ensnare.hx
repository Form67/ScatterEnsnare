package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;

class Ensnare extends FlxSprite
{
	var _snare:Ensnare;

	public function new(?X:Float = 0, ?Y:Float = 0)
	{
		super(X, Y);
		makeGraphic(16, 16, FlxColor.BLUE);
		width = 50;
		height = 50;
		updateHitbox();
	}
	override public function update(elapsed:Float):Void{
		super.update(elapsed);
	}
}