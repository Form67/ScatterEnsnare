 package;

 import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.FlxG;

 class Player extends FlxSprite
 {
	 public var speed:Float = 200;
	 
     public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
     {
         super(X, Y);
		 makeGraphic(32, 32, 0xFFFFFFFF);
		 drag.x = drag.y = 100;
		 
		 updateHitbox();
		 
     }
	 
	 function Scatter():Void
	 {
	
	 }
	 
	 function Ensnare():Void
	 {
		 
	 }
	 
	 //Code used from HaxeFlixel documentation
	 function movement():Void
	 {
		var _up:Bool = false;
		var _down:Bool = false;
		var _left:Bool = false;
		var _right:Bool = false; 
		
		var _ypspeed:Float = 0;
		var _xspeed:Float = 0;		
		
		
		_up = FlxG.keys.anyPressed([W]);
		_down = FlxG.keys.anyPressed([S]);
		_left = FlxG.keys.anyPressed([A]);
		_right = FlxG.keys.anyPressed([D]);
		
		if (_up)
		{
			_ypspeed -= speed;
		}
		
		if (_down)
		{
			_ypspeed += speed;
		}
		
		if (_left)
		{
			_xspeed -= speed;
		}
		
		if (_right)
		{
			_xspeed += speed;
		}

		if (FlxG.keys.anyJustPressed([J]))
		{
			Scatter();
		}
		
		if (FlxG.keys.anyJustPressed([K]))
		{
			Ensnare();
		}
		
		velocity.set(_xspeed, _ypspeed);
		
	 }
	 
	 
	 override public function update(elapsed:Float):Void
	 {
		 movement();
		 super.update(elapsed);
	 }
 }