package;

import flixel.FlxState;

class PlayState extends FlxState
{
	var _player:Player;
	var _score:Int;
	
	override public function create():Void
	{
		_player = new Player(20, 20);
		add(_player);
		_score = 0;
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
