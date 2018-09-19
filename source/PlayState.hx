package;

import flixel.FlxState;
import flixel.FlxG;

class PlayState extends FlxState
{
	var _player:Player;
	var _score:Int;
	
	var _HUD:HUD;
	var _money:Int = 1000;
	
	override public function create():Void
	{
		_player = new Player(20, 20);
		_HUD = new HUD();
		add(_HUD);
		add(_player);
		_score = 0;
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		_money -= 1;
		_HUD.UpdateHUD(_money);
		
		if (_money < 1)
		{
			FlxG.switchState(new GameOverState());
		}
	}
}
