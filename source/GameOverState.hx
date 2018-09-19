package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;

class GameOverState extends FlxState
{
	var _text : FlxText;
	
	override public function create():Void
	{
		_text = new FlxText(0, 0, 0, "GAME OVER", 40);
		_text.x = (800 / 2) - (_text.width/2);
		_text.y = (600 / 2) - (_text.height / 2);
		_text.screenCenter();
		add(_text);
		super.create();
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}
