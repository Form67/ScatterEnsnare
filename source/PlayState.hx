package;

import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;


class PlayState extends FlxState
{
	public var level:Tilemap;
	var _player:Player;
	public var _grpSnare:FlxTypedGroup<Ensnare>;
	public var grpSeeds:FlxTypedGroup<Seeds>;
	public var _grpMonster:FlxTypedGroup<Enemy>;
	
	var _HUD:HUD;
	var _money:Int = 1000;
	var _moneytick:Int = 0;
	var _moneytickmax:Int = 10;
	var _moneyovertime = 5;
	var _trapmoney:Int = 50;
	var _seedmoney:Int = 50;
	var _moneygoal:Int = 2000;
	var _currlevel:Int = 1;
	
	var _trapSound:FlxSound;
	
	override public function create():Void
	{
		
		FlxG.mouse.visible = false;
		level = new Tilemap("assets/tiled/GD1-project-tilemap1.tmx", this);
		add(level.backgroundLayer);
		add (level.foregroundTiles);
		
		
		_grpMonster = new FlxTypedGroup<Enemy>();
		add(_grpMonster);
		FlxG.sound.playMusic(AssetPaths.FarmingJaunt8Bit__wav, 1, true);
		_trapSound = FlxG.sound.load(AssetPaths.trapclose__wav);
		_grpSnare = new FlxTypedGroup<Ensnare>();
		add(_grpSnare);
		grpSeeds = new FlxTypedGroup<Seeds>();
		add(grpSeeds);
		_player = new Player(20, 20,_grpSnare,grpSeeds,_grpMonster,level.foregroundTiles);
		FlxG.sound.playMusic(AssetPaths.FarmingJaunt8Bit__wav, 1, true);
		_HUD = new HUD();
		add(_HUD);
		add(_player);
	
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (_moneytick == _moneytickmax)
		{
			_money -= _moneyovertime;
			_moneytick = 0;
		}
		else
		{
			_moneytick += 1;
		}
		_HUD.UpdateHUD(_money);
		
		if (_money < 1)
		{
			FlxG.switchState(new GameOverState(1));
		}
		
		if (FlxG.keys.anyPressed([P]))
		{
			_money += 100;
		}
		
		if (_money >= _moneygoal)
		{
			FlxG.switchState(new LevelTwo());
		}
		
		FlxG.overlap(_grpSnare, _grpMonster, monsterTouchTrap);
		
		if (_player.scattered)
		{
			SubMoney(_seedmoney);
			_player.scattered = false;
		}
		
		if (_player.trapplaced)
		{
			SubMoney(_trapmoney);
			_player.trapplaced = false;
		}
	}
	
	function monsterTouchTrap(E:Ensnare,M:Enemy):Void{
		if (E.alive && E.exists && M.alive && M.exists){
			_money += 110;
			E.destroy();
			M.destroy();
			_trapSound.play(true, 300);
			
		}
		
	}
	function placeEntities(entityName:String):Void{
		
		
	}
	
	function SubMoney(amount:Int):Void
	{
		_money -= amount;
	}
}
