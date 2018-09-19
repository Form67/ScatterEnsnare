package;

import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;

class PlayState extends FlxState
{
	var _player:Player;
	var _score:Int;
	public var _grpSnare:FlxTypedGroup<Ensnare>;
	var _grpMonster:FlxTypedGroup<Enemy>;
	
	var _HUD:HUD;
	var _money:Int = 1000;
	
	override public function create():Void
	{
		FlxG.sound.playMusic(AssetPaths.Farming_Jaunt_8_Bit__WAV, 1, true);
		_grpSnare = new FlxTypedGroup<Ensnare>();
		add(_grpSnare);
		_player = new Player(20, 20,_grpSnare);
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
		FlxG.overlap(_grpSnare, _grpMonster,monsterTouchTrap);
	}
	
	function monsterTouchTrap(E:Ensnare,M:Enemy):Void{
		if(E.alive&&E.exists&&M.alive&&M.exists){
			//turn off monster movement then kill
			
		}
		
	}
	function placeEntities(entityName:String):Void{
		
		
	}
}
