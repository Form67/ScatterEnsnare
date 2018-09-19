package;

import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{
	var _player:Player;
	var _score:Int;
	var _grpSnare:FlxTypedGroup<Ensnare>;

	override public function create():Void
	{
		_player = new Player(20, 20);
		_grpSnare = new FlxTypedGroup<Ensnare>();
		add(_player);
		add(_grpSnare);
		_score = 0;
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		FlxG.collide()_
		super.update(elapsed);
	}
}
