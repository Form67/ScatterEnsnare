package;

import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;


class PlayState extends FlxState
{
	public var level:Tilemap;
	var _player:Player;
	var _score:Int;
	public var _grpSnare:FlxTypedGroup<Ensnare>;
	public var grpSeeds:FlxTypedGroup<Seeds>;
	var _grpMonster:FlxTypedGroup<Enemy>;
	
	var _HUD:HUD;
	var _money:Int = 50000;
	var _moneytick:Int = 0;
	var _moneytickmax:Int = 10;
	var _moneyovertime = 5;
	var _trapmoney:Int = 50;
	var _seedmoney:Int = 50;
	
	override public function create():Void
	{
		FlxG.mouse.visible = false;
		level = new Tilemap("assets/tiled/GD1-project-tilemap1.tmx", this);
		add(level.backgroundLayer);
		
		add (level.foregroundTiles);
		FlxG.sound.playMusic(AssetPaths.FarmingJaunt8Bit__wav, 1, true);
		_grpSnare = new FlxTypedGroup<Ensnare>();
		add(_grpSnare);
		grpSeeds = new FlxTypedGroup<Seeds>();
		add(grpSeeds);
		_player = new Player(20, 20,_grpSnare,grpSeeds);
		_HUD = new HUD();
		add(_HUD);
		add(_player);
		_score = 0;
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
			FlxG.switchState(new GameOverState());
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
		if(E.alive&&E.exists&&M.alive&&M.exists){
			//turn off monster movement then kill
			
		}
		
	}
	function placeEntities(entityName:String):Void{
		
		
	}
	
	function SubMoney(amount:Int):Void
	{
		_money -= amount;
	}
	
	function LevelTwo():Void
	{
		//level = nextlevel;
		//_money = newmoney;
		//seedmoney = newseedmoney;
		//trapmoney = newtrapmoney;
		//_moneytickmax = newmoneytickmax;
		//_moneyovertime = newmoneyovertime;
	}
	
	function LevelThree():Void
	{
		//level = nextlevel;
		//_money = newmoney;
		//seedmoney = newseedmoney;
		//trapmoney = newtrapmoney;
		//_moneytickmax = newmoneytickmax;
		//_moneyovertime = newmoneyovertime;
	}
	
	function LevelFour():Void
	{
		//level = nextlevel;
		//_money = newmoney;
		//seedmoney = newseedmoney;
		//trapmoney = newtrapmoney;
		//_moneytickmax = newmoneytickmax;
		//_moneyovertime = newmoneyovertime;
	}
	
	function LevelFive():Void
	{
		//level = nextlevel;
		//_money = newmoney;
		//seedmoney = newseedmoney;
		//trapmoney = newtrapmoney;
		//_moneytickmax = newmoneytickmax;
		//_moneyovertime = newmoneyovertime;
	}
}
