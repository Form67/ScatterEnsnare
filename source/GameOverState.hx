package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.math.FlxRandom;

class GameOverState extends FlxState
{
	var _text : FlxText;
	var _message : String;
	
	
	function randtext(level:Int):String
	{
		var r = new FlxRandom();
		var num = 0;
		if (level == 1)
		{
			num = r.int(0, 2);
			
			if (num == 0)
			{
				return "Maybe you should take up a career as an NPC instead";
			}
			
			if (num == 1)
			{
				return "The dungeons are as barren as your profits";
			}
			
			if (num == 2)
			{
				return "Let’s just say that you did your best and leave it at that, okay?";
			}
		}
		
		if (level == 2)
		{
			num = r.int(0, 2);
			if (num == 0)
			{
				return "Your monsters made a nice side quest for a b-list RPG dungeon";
			}
			
			if (num == 1)
			{
				return "The heroes had an easy time today";
			}
			
			if (num == 2)
			{
				return "Something is always better than nothing";
			}
		}
		
		if (level == 3)
		{
			num = r.int(0, 1);
			if (num == 0)
			{
				return "In a world of monsters, you made ends meet just fine";
			}
			
			if (num == 1)
			{
				return "I’d say you made a respectable effort";
			}
		}
		
		if (level == 4)
		{
			num = r.int(0, 1);
			if (num == 0)
			{
				return "Solid work!  You’re starting to make a name for yourself among RPG developers who are seeking well-grown monsters";
			}
			
			if (num == 1)
			{
				return "Now that’s what I call a dungeon!";
			}
		}
		
		if (level == 5)
		{
			return "You’re living the high life!  Perhaps you’d like to settle down in some foreign kingdom when you retire?";
		}
		
		return "oops!";
	}
	
	override public function new(level:Int):Void
	{
		super();
		_message = randtext(level);
		_text = new FlxText(0, 0, 0, _message, 8);
		_text.screenCenter();
		add(_text);
		
		
	}
	
	/*
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}*/
	
}
