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
	var tutorial : Bool = false;
	var story : Bool = false;
	
	override public function create():Void
	{
		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic(AssetPaths.FarmingJauntOrchestra__wav, 1, true);
		}
		_playButton = new FlxButton(20, 20, "PLAY NOW", clickPlay);
		_playButton.screenCenter();
		add(_playButton);
		
		_storyscreen = new FlxSprite(0,0, AssetPaths.TutorialScreen__png);
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
			if (FlxG.keys.anyPressed([W,S,A,D,J,K]))
			{
				add(_tutorialscreen);
				tutorial = true;
				story = false;
			}
		}
		if (tutorial)
		{
			if (FlxG.keys.anyPressed([W,S,A,D,J,K]))
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
