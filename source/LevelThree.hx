import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

class LevelThree extends LevelTwo
{
	override public function create():Void
	{
		FlxG.mouse.visible = false;
		level = new Tilemap("assets/tiled/GD1-project-tilemap3.tmx", this);
		add(level.backgroundLayer);
		add (level.foregroundTiles);
		
		_trapSound = FlxG.sound.load(AssetPaths.trapclose__wav);
		_grpMonster = new FlxTypedGroup<Enemy>();
		add(_grpMonster);
		_grpSnare = new FlxTypedGroup<Ensnare>();
		add(_grpSnare);
		grpSeeds = new FlxTypedGroup<Seeds>();
		add(grpSeeds);
		
		
		
		
		_player = new Player(20, 20,_grpSnare,grpSeeds,_grpMonster,level.foregroundTiles);
		_HUD = new HUD();
		add(_HUD);
		add(_player);
		
		_moneytickmax = 10;
	
		//super.create();
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
			FlxG.switchState(new GameOverState(3));
		}
		
		if (FlxG.keys.anyPressed([P]))
		{
			_money += 100;
		}
		
		if (_money >= _moneygoal)
		{
			FlxG.switchState(new LevelFour());
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
}