package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAsset;

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
	public function collide():Void{
		
	}
	override public function update(elapsed:Float):Void{
		collide();
		super.update(elapsed);
	}
}