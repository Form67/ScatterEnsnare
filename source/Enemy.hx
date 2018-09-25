package;

 import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
 class Enemy extends FlxSprite
 {
	 public var speed:Float = 200;
	 
     public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
     {
         super(X, Y);
		 makeGraphic(32, 32, 0xFFFFFFFF);
		 
		 updateHitbox();
		 
     }
	 //Code used from HaxeFlixel documentation
	 function movement():Void
	 {
		var _ypspeed:Float = 0;
		var _xspeed:Float = 0;		

		
	 }
	 
	 
	 override public function update(elapsed:Float):Void
	 {
		 movement();
		 super.update(elapsed);
	 }
 }