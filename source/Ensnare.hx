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
		loadGraphic("assets/images/Trap1.png", true);
		updateHitbox();
	}
	override public function update(elapsed:Float):Void{
		super.update(elapsed);
	}
}