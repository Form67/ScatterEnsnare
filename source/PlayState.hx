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
	

	override public function create():Void
	{
		_grpSnare = new FlxTypedGroup<Ensnare>();
		add(_grpSnare);
		_player = new Player(20, 20,_grpSnare);
		add(_player);
		_score = 0;
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
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
