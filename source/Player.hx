 package;

 import flixel.FlxSprite;
 import flixel.group.FlxGroup;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.FlxG;
 import flixel.group.FlxGroup.FlxTypedGroup;
 import flixel.system.FlxSound;
 
 class Player extends FlxSprite
 {
	 public var trapplaced:Bool;
	 public var scattered:Bool;
	 
	 public var speed:Float = 200;
	 public var currentRandomSeeds:Int;
	 public var snares:FlxTypedGroup<Ensnare>;
	 public var seeds:FlxTypedGroup<Seeds>;
	 public var mons:FlxTypedGroup<Enemy>;
	 
	 var _scatterSound:FlxSound;
	 var _ensnareSound:FlxSound;
	 var _footstep1:FlxSound;
	 var _footstep2:FlxSound;
	 
	 
	 public var fore:FlxGroup;
	var trapCool:Float =0;
	 var seedCool:Float =0;
     public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, _grpSnare:FlxTypedGroup<Ensnare>,grpSeeds:FlxTypedGroup<Seeds>,grpMons:FlxTypedGroup<Enemy>,grpTiles:FlxGroup)
     {
         super(X, Y);
		 fore = grpTiles;
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
		 mons = grpMons;
		 updateHitbox();
		 trapplaced = false;
		 scattered = false;
		 
		 _footstep1 = FlxG.sound.load(AssetPaths.footstep1__wav);
		 _footstep2 = FlxG.sound.load(AssetPaths.footstep2__wav);
		 _scatterSound = FlxG.sound.load(AssetPaths.scatter__wav);
		 _ensnareSound = FlxG.sound.load(AssetPaths.ensnare__wav);
     }
	 
	 function Scatter():Void
	 {
		scattered = true;
		animation.play("scatter");
		_scatterSound.play(true,200);
		currentRandomSeeds = Std.int(Math.random() * 3 +1);
		var Seed = new Seeds(this.x+this.width/2 -8, this.y+10, 0,seeds,mons,fore);
		seeds.add(Seed);
		if(currentRandomSeeds >1){
			var Seed2 = new Seeds(this.x+this.width/2-8, this.y+10, 1,seeds,mons,fore);
			seeds.add(Seed2);
		}
		if (currentRandomSeeds >2){
			var Seed3 = new Seeds(this.x+this.width/2-8, this.y+10, 2,seeds,mons,fore);
			seeds.add(Seed3);
		}
	 }
	 
	 function Ensnare():Void
	 {
		 trapplaced = true;
		animation.play("ensnare");
		_ensnareSound.play(true,430);
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
		
		var step:Int = 1;
		
		
		_up = FlxG.keys.anyPressed([W]);
		_down = FlxG.keys.anyPressed([S]);
		_left = FlxG.keys.anyPressed([A]);
		_right = FlxG.keys.anyPressed([D]);
		
		
		if (_up)
		{
			animation.play("right");
			_ypspeed -= speed;
			
			if (step == 1)
			{
				step = 2;
				_footstep1.play();
			}
			else{
				step = 1;
				_footstep2.play();
			}
		}
		
		if (_down)
		{
			_ypspeed += speed;
			
			if (step == 1)
			{
				step = 2;
				_footstep1.play();
			}
			else{
				step = 1;
				_footstep2.play();
			}
		}
		
		if (_left)
		{
			animation.play("left");
			_xspeed -= speed;
			
			if (step == 1)
			{
				step = 2;
				_footstep1.play();
			}
			else{
				step = 1;
				_footstep2.play();
			}
		}
		
		if (_right)
		{
			animation.play("right");
			_xspeed += speed;
			
			if (step == 1)
			{
				step = 2;
				_footstep1.play();
			}
			else{
				step = 1;
				_footstep2.play();
			}
		}
		
		if (FlxG.keys.anyJustPressed([J])&& seedCool<=0)
		{
			seedCool = .1;
			Scatter();
		}
		
		if (FlxG.keys.anyJustPressed([K])&&trapCool <=0)
		{
			trapCool = .1;
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
		 seedCool -= elapsed;
		 trapCool -= elapsed;
	 }

 }