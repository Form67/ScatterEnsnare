package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
class Enemy extends FlxSprite
{
    public var speed:Float = 200;
    var Direction:Float;
    var MonsterType:Float;
    public var grpMonster:FlxTypedGroup<Enemy>;
    public function new(?X:Float = 0, ?Y:Float = 0, ?D:Float = 0, ?S:FlxTypedGroup<Enemy>, ?M:Float = 0)
    {
        super(X, Y);
        Direction = D;
        MonsterType = M;
        if (M == 0) {
            loadGraphic("assets/images/monster_1_fin.png", true);
        }
        if (M == 1) {
            loadGraphic("assets/images/monster_2_fin.png", true);
        }
        if (M == 2 ) {
            loadGraphic("assets/images/monster_3_fin.png", true);
        }
         
    }
    // Code used from HaxeFlixel documentation
    function movement():Void
    {
        var _ypspeed:Float = 0;
        var _xspeed:Float = 0;      

        
    }
     
     
    override public function update(elapsed:Float):Void
    {
        if (MonsterType == 0) {
            if (Direction == 0) {
                velocity.x = -speed;
            }
            else if (Direction == 1) {
                velocity.x = speed;
            }
            else if (Direction == 2) {
                velocity.y = -speed;
            }
            else if (Direction == 3) {
                velocity.y = speed;
            }

        }

        if (MonsterType == 1) {
            if (Direction == 0) {
                velocity.x = -speed;
            }
            else if (Direction == 1) {
                velocity.x = speed;
            }
            else if (Direction == 2) {
                velocity.y = -speed;
            }
            else if (Direction == 3) {
                velocity.y = speed;
            }
        }
        if (MonsterType == 2) {
            if (Direction == 0) {
                velocity.x = -speed;
            }
            else if (Direction == 1) {
                velocity.x = speed;
            }
            else if (Direction == 2) {
                velocity.y = -speed;
            }
            else if (Direction == 3) {
                velocity.y = speed;
            }
        }
        super.update(elapsed);
    }
 }
