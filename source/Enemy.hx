package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
class Enemy extends FlxSprite
{
    public var grpMonster:FlxTypedGroup<Enemy>;
    public var speed:Float;
    var Direction:Int;
    var MonsterType:Float;
    var LifeSpan:Float = 1.5;
    var Flag:Boolean = false;

    // M should be either 0, 1 or 2
    public function new(?X:Float = 0, ?Y:Float = 0, ?D:Int = 0, ?S:FlxTypedGroup<Enemy>, ?M:Float = 0)
    {
        super(X, Y);
        Direction = D;
        MonsterType = M;
        if (M == 0) {
            loadGraphic("assets/images/monster_1_fin.png", true);
            speed = 125;
        }
        if (M == 1) {
            loadGraphic("assets/images/monster_2_fin.png", true);
            speed = 200;
        }
        if (M == 2 ) {
            loadGraphic("assets/images/monster_3_fin.png", true);
            speed = 75;
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
            if (Direction == 0) { // Left
                velocity.x = -speed;
            }
            else if (Direction == 1) { // Right
                velocity.x = speed;
            }
            else if (Direction == 2) { // Up
                velocity.y = -speed;
            }
            else if (Direction == 3) { // Down
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

            RandomSeed = Std.int(Math.random() * 200);
            if (RandomSeed < 1) {
                speed += 25;
                RandomDirection = Std.int(Math.random() * 2 + 1);
                if (Direction == 0 || Direction == 1) {
                    if (RandomDirection <= 1) {
                        Direction = 2;
                    }
                    else {
                        Direction = 3;
                    }
                }
                if (Direction == 2 || Direction == 3) {
                    if (RandomDirection <= 1) {
                        Direction = 0;
                    }
                    else {
                        Direction = 1;
                    }
                }
            }
        }

        if (MonsterType == 2) {
            super.update(elapsed);
            LifeSpan -= FlxG.elapsed;
            if (Flag == false && LifeSpan <= 0) {
                speed = 325;
                RandomDirection = Std.int(Math.random() * 2 + 1);
                if (Direction == 0 || Direction == 1) {
                    if (RandomDirection <= 1) {
                        Direction = 2;
                    }
                    else {
                        Direction = 3;
                    }
                }
                if (Direction == 2 || Direction == 3) {
                    if (RandomDirection <= 1) {
                        Direction = 0;
                    }
                    else {
                        Direction = 1;
                    }
                }
                Flag = true;
            }
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
    }
 }
