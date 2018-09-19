package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;


class HUD extends FlxTypedGroup<FlxSprite>
{
	var _money:FlxText;
	var _gold:FlxText;
	
	public function new()
	{
		super();
		_money = new FlxText(730, 0, 0, "0", 16);
		_gold = new FlxText(750, 0, 0, "GOLD", 16);
		
		_money.x = _gold.x - _money.width - 4;
		
		_gold.alignment = RIGHT;
		_money.alignment = RIGHT;
		_gold.color = 0xFFFFFFFF;
		_money.color = 0xFFFFFFFF;
		add(_money);
		add(_gold);
	}
	
	public function UpdateHUD(Money:Int = 0):Void
	{
		_money.text = Std.string(Money);
		_money.x = _gold.x - _money.width - 4; 
	}
}