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
     public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, _grpSnare:FlxTypedGroup<Ensnare>,grpSeeds:FlxTypedGroup<Seeds>)
     {
         super(X, Y);
		 loadGraphic("assets/images/FarmerSprites.png", true);
		 animation.add("standing", [0], 30, true);
		 animation.add("left", [1, 2, 3, 2], 5, false, true);
		 animation.add("right", [1, 2, 3, 2], 5, false);
		 animation.add("scatter", [4, 4, 4,0], 5, false);
		 animation.add("ensnare", [5,5,5,0], 5, false);
		 drag.x = drag.y = 100;
		  scale.set(.5, .5);
		 snares = _grpSnare;
		 seeds = grpSeeds;
		 updateHitbox();
		 
     }
	 
	 function Scatter():Void
	 {
		animation.play("scatter");
		currentRandomSeeds = Std.int(Math.random() * 3 +1);
		var Seed = new Seeds(this.x+this.width/2 -8, this.y+10, 0,seeds);
		seeds.add(Seed);
		if(currentRandomSeeds >1){
			var Seed2 = new Seeds(this.x+this.width/2-8, this.y+10, 1,seeds);
			seeds.add(Seed2);
		}
		if (currentRandomSeeds >2){
			var Seed3 = new Seeds(this.x+this.width/2-8, this.y+10, 2,seeds);
			seeds.add(Seed3);
		}
	 }
	 
	 function Ensnare():Void
	 {
		animation.play("ensnare");
		 var newSnare = new Ensnare(this.x+40, this.y+this.height-15);
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
			animation.play("left");
			_xspeed -= speed;
		}
		
		if (_right)
		{
			animation.play("right");
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
		
		if (_xspeed == 0 && _ypspeed == 0)
		{
			//animation.play("standing");
		}
		
	 }
	 
	 
	 override public function update(elapsed:Float):Void
	 {
		 movement();
		 super.update(elapsed);
	 }

 }