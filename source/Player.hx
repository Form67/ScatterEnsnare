 package;

 import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
 class Player extends FlxSprite
 {
	 public var speed:Float = 200;
	 public var currentRandomSeeds:Int;
	 private var snares:FlxTypedGroup<Ensnare>;
	 private var seeds:FlxTypedGroup<Seeds>;
     public function new(?X:Float=0, ?Y:Float=0,_grpSnare:FlxTypedGroup<Ensnare>,grpSeeds:FlxTypedGroup<Seeds>)
     {
         super(X, Y);
		 makeGraphic(32, 32, 0xFFFFFFFF);
		 drag.x = drag.y = 100;
		 snares = _grpSnare;
		 seeds = grpSeeds;
		 updateHitbox();
		 
     }
	 
	 function Scatter():Void
	 {
		currentRandomSeeds = Std.int(Math.random() * 3 +1);
		var Seed = new Seeds(this.x+15, this.y+15, 0,seeds);
		seeds.add(Seed);
		if(currentRandomSeeds >1){
			var Seed2 = new Seeds(this.x+15, this.y+15, 1,seeds);
			seeds.add(Seed2);
		}
		if (currentRandomSeeds >2){
			var Seed3 = new Seeds(this.x+15, this.y+15, 2,seeds);
			seeds.add(Seed3);
		}
	 }
	 
	 function Ensnare():Void
	 {
		 var newSnare = new Ensnare(this.x+13, this.y+45);
		snares.add(newSnare);
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