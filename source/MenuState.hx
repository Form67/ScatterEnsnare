package;

import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxG;

class MenuState extends FlxState
{
	var _playButton : FlxButton;
	
	override public function create():Void
	{
		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic(AssetPaths.FarmingJauntOrchestra__wav, 1, true);
		}
		_playButton = new FlxButton(20, 20, "PLAY NOW", clickPlay);
		_playButton.screenCenter();
		add(_playButton);
		super.create();
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	function clickPlay():Void
	{
		FlxG.switchState(new PlayState());
	}
}
