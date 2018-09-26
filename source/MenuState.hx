package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxG;

class MenuState extends FlxState
{
	var _playButton : FlxButton;
	var _tutorialscreen : FlxSprite;
	var _storyscreen : FlxSprite;
	var _menuscreen : FlxSprite;
	var tutorial : Bool = false;
	var story : Bool = false;
	
	override public function create():Void
	{
		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic(AssetPaths.FarmingJauntOrchestra1__wav, 1, true);
		}
		
		_menuscreen = new FlxSprite(0, 0, AssetPaths.Menu_Screen__png);
		_menuscreen.setGraphicSize(800,600);
		_menuscreen.screenCenter;
		add(_menuscreen);
		
		_playButton = new FlxButton(20, 20, "PLAY NOW", clickPlay);
		_playButton.screenCenter();
		_playButton.setPosition(_playButton.getPosition().x, 350);
		add(_playButton);
		
		_storyscreen = new FlxSprite(0,0, AssetPaths.StoryBlurb__png);
		_storyscreen.setGraphicSize(800,600);
		_storyscreen.screenCenter();
		
		
		_tutorialscreen = new FlxSprite(0,0, AssetPaths.TutorialScreen__png);
		_tutorialscreen.setGraphicSize(800,600);
		_tutorialscreen.screenCenter();
		super.create();
		
	}

	override public function update(elapsed:Float):Void
	{
		if (story)
		{
			if (FlxG.keys.anyJustPressed([W,S,A,D,J,K]))
			{
				add(_tutorialscreen);
				tutorial = true;
				story = false;
			}
		}
		else if (tutorial)
		{
			if (FlxG.keys.anyJustPressed([W,S,A,D,J,K]))
			{
				FlxG.switchState(new PlayState());
			}
		}
		super.update(elapsed);
	}
	
	function clickPlay():Void
	{
		add(_storyscreen);
		story = true;
	}
}
