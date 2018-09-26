package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.math.FlxRandom;

class GameOverState extends FlxState
{
	var _text : FlxText;
	var _message : String;
	var _art : FlxSprite;
	
	
	function randtext(level:Int):String
	{
		var r = new FlxRandom();
		var num = 0;
		if (level == 1)
		{
			num = r.int(0, 1);
			
			if (num == 0)
			{
				return "Despite your efforts, your career was cut tragically short.";
			}
			
			if (num == 1)
			{
				return "Well, as long as you did your best, that’s what’s really important, right?";
			}
		}
		
		if (level == 2)
		{
			num = r.int(0, 1);
			if (num == 0)
			{
				return "Your farming skills are steadily improving.";
			}
			
			if (num == 1)
			{
				return "Something is always better than nothing.";
			}
		}
		
		if (level == 3)
		{
			num = r.int(0, 1);
			if (num == 0)
			{
				return "I’d say you made a respectable effort!";
			}
			
			if (num == 1)
			{
				return "Seems like you’re starting to get the hang of this line of work!";
			}
		}
		
		if (level == 4)
		{
			num = r.int(0, 1);
			if (num == 0)
			{
				return "You’re starting to make a name for yourself among RPG developers who are seeking well-grown monsters.";
			}
			
			if (num == 1)
			{
				return "Up and coming farmers have started asking you for advice on how to run their farms.  Good work!";
			}
		}
		
		if (level == 5)
		{
			return "With monopolies across the board, you’re set for life!  Time for a world trip to any RPG location you desire.";
		}
		
		return "oops!";
	}
	
	override public function new(level:Int):Void
	{
		super();
		
		
		_art = new FlxSprite(0, 0, AssetPaths.Game_Over_Screen__png);
		_art.setGraphicSize(800,600);
		_art.screenCenter;
		add(_art);
		
		
		_message = randtext(level);
		_text = new FlxText(0, 0, 0, _message, 10);
		_text.screenCenter();
		_text.setPosition(_text.getPosition().x, 250);
		add(_text);
		
		
	}
	
	/*
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}*/
	
}
