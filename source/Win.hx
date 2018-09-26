import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;


class Win extends FlxState
{
	
	var screen1 : Bool = false;
	var screen2 : Bool = false;
	var art : FlxSprite;
	var txt : FlxText;
	var txt2 : FlxText;
	var txt3 : FlxText;
	
	override public function create():Void
	{
		art = new FlxSprite(0, 0, AssetPaths.Winning_Screen__png);
		art.setGraphicSize(800,600);
		art.screenCenter();
		
		txt = new FlxText(0, 0, 0, "You've achieved great success in the world of farming! With monopolies across the board, you're set for life.", 10);
		txt.screenCenter();
		txt.setPosition(txt.getPosition().x, 350);
		txt.color = FlxColor.BLACK;
		
		txt2 = new FlxText(0, 0, 0, "Time for a world trip to any RPG location you desire!", 10);
		txt2.screenCenter();
		txt2.setPosition(txt2.getPosition().x, 400);
		txt2.color = FlxColor.BLACK;
		
		
		txt3 = new FlxText(0, 0, 0, "Press [J] to return to the menu", 10);
		txt3.screenCenter();
		txt3.setPosition(txt2.getPosition().x, 500);
		txt3.color = FlxColor.BLACK;
		
		add(art);
		add(txt);
		add(txt2);
		add(txt3);
	}
	
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.anyJustPressed([J]))
		{
			FlxG.switchState(new MenuState());
		}
	}
}