import openfl.geom.ColorTransform;

var charColors = [0xff969494, 0xFFBFE5BA];
var houseColors = [0xFF8f8f8f, 0xFF9ADA91];
var rockColors = [0xFFbababa, 0xFFB8D4B5];
var coolThingColors = [0xFFc4c0c0, 0xFFC1CEAA];
var velocityShitHehe:Int = 1;
strengthVal = 0;
function postCreate(){
    camera.followLerp = 0.08;

    defaultCamZoom = camGame.zoom = camera.zoom = .9;

    dad.cameraOffset.set(250,100);
    boyfriend.cameraOffset.set(-300,-50);

    fontShit = "Gumball";
}
function create(){
    house.color = houseColors[0];

    tweenLoopAngle(house, 4, -4, 6, 6);
    tweenLoopAngle(rock2, 360, 0, 30, 30);
    tweenLoopAngle(things, 2, -2, 5, 5);

    things.color = coolThingColors[0];
    platform.color = rockColors[0];
    rock.color = houseColors[0];
    rock2.color = houseColors[0];
    rock3.color = houseColors[0];

    {
        FlxTween.tween(rock3, {angle: 360}, 30, {
        ease: FlxEase.sineInOut
        });
    }
    things.alpha = 0.001;

    stupidFix = FlxTween.tween(things, {y: things.y}, 1);
    houseShit = FlxTween.tween(house, {y: house.y-50}, 2.5, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
}
function tweenLoopAngle(varx, distance1, distance2, duration1, duration2) {
    FlxTween.tween(varx, {angle: distance1}, duration1 / velocityShitHehe, {
        ease: FlxEase.sineInOut,
        onComplete: 
        function (twn:FlxTween)
            {
                FlxTween.tween(varx, {angle: distance2}, duration2 / velocityShitHehe, {
                    ease: FlxEase.sineInOut,
                    onComplete: 
                    function (twn:FlxTween)
                        {
                            tweenLoopAngle(varx, distance1, distance2, duration1, duration2);
                        }
                });
            }
    });
}
function triggerEvent(color:String, time:Float) {
    FlxTween.tween(boyfriend, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(dad, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(house, {color: color}, time, {ease: FlxEase.quadInOut});

    FlxTween.tween(platform, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(rock, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(rock2, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(rock3, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(things, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(glitch, {color: color}, time, {ease: FlxEase.quadInOut});
}
var applayShaderToGlitch:Bool = false;
function update(){
    bg.shader = rock.shader = rock2.shader = rock3.shader = house.shader = dad.shader;
}

function tweenZoom(zoomValue: Float, duration: Float, ease: IFlxEase, updateDefaultZoom: Bool = true) {
    FlxTween.tween(camGame, {zoom: zoomValue}, duration, {ease: ease});
    if (updateDefaultZoom) {
        defaultCamZoom = zoomValue;
    }
}
function tweenCamZoom(zoomValue: Float, duration: Float, ease: IFlxEase, updateDefaultZoom: Bool = true) {
    FlxTween.tween(camGame, {zoom: zoomValue}, duration, {ease: ease});
    if (updateDefaultZoom) {
        defaultCamZoom = zoomValue;
    }
}
function gone(){
    balck.alpha = 1;
}
function void(){
    balck.alpha = floor.alpha = wall.alpha = thungssss.alpha = 0.01;
    things.alpha = 1;
    dad.cameraOffset.set(0,-100);
    boyfriend.cameraOffset.set(-300,0);
    boyfriend.y = -25;
    defaultCamZoom = .7;
}