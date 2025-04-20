import openfl.geom.ColorTransform;

importScript("data/scripts/iconP3");
importScript("data/scripts/healthbar");

public var platformCam:FlxCamera;
var charColors = [0xff969494, 0xFFBFE5BA];
var houseColors = [0xFF8f8f8f, 0xFF9ADA91];
var rockColors = [0xFFbababa, 0xFFB8D4B5];
var coolThingColors = [0xFFc4c0c0, 0xFFC1CEAA];
var velocityShitHehe:Int = 1;

function postCreate(){
    platformCam = new FlxCamera();
    camGame.addShader(funnidumb);
    
    camHUD.alpha = 0.001;
    camera.followLerp = 0.08;
    balck.alpha = 1;

    defaultCamZoom = camGame.zoom = camera.zoom = .55;

    dad.cameraOffset.set(0,-200);
    boyfriend.cameraOffset.set(-300,-300);
    gf.cameraOffset.set(-400,-200);

    fontShit = "Gumball";
    add(platformCam, false);
    platformCam.cameras = [camGame];
}
function create(){
    house.color = houseColors[0];

    tweenLoopAngle(house, 4, -4, 6, 6);
    tweenLoopAngle(things, 2, -2, 5, 5);

    things.color = coolThingColors[0];
    platform.color = rockColors[0];


    stupidFix = FlxTween.tween(things, {y: things.y}, 1);
    houseShit = FlxTween.tween(house, {y: house.y-50}, 2.5, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
}
function onEvent(e){
    if (e.event.name == "BadApple but better"){
        if (e.event.params[0] == true || e.event.params[0] == null){
            bg.alpha = 0.0001;
            glitch.alpha = 0.0001;
            house.alpha = 0.0001;
            platform.alpha = 0.0001;
    
            things.alpha = 0.0001;

        } else if (e.event.params[0] == false){
            bg.alpha = 1;
            glitch.alpha = 1;
            house.alpha = 1;
            platform.alpha = 1;
            
            things.alpha = 1;
        }
    }
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
function onSongStart(){
    boyfriend.color = charColors[0];
    dad.color = charColors[0];
    gf.color = charColors[0];
    
    camHUD.angle = -20;
    camHUD.y -= 300;   
}
function triggerEvent(color:String, time:Float) {
    FlxTween.tween(boyfriend, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(dad, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(gf, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(house, {color: color}, time, {ease: FlxEase.quadInOut});

    FlxTween.tween(platform, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(things, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(glitch, {color: color}, time, {ease: FlxEase.quadInOut});

    //hud elements
    FlxTween.tween(iconP1, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(iconP2, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(iconP3, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(hudTxt, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(timeTxt, {color: color}, time, {ease: FlxEase.quadInOut});
    FlxTween.tween(timeBar, {color: color}, time, {ease: FlxEase.quadInOut});
    if(color == "0x939393"){
        shader.replacementColour = [0.6, 0.8, 1];
    }else if(color == "0xB9FFB9"){
        shader.replacementColour = [0.725, 1.0, 0.725];
    }else if(color == "0x6559AE"){
        shader.replacementColour = [0.396, 0.349, 0.682];
    }
}
var applayShaderToGlitch:Bool = false;
function update(){
    if(!applayShaderToGlitch){
        bg.shader = house.shader = things.shader = dad.shader;
    }else{
        glitch.shader = house.shader = things.shader = dad.shader;
    }
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
function stepHit() {
    switch (curStep) {
        case 1:
            FlxTween.tween(balck, {alpha: 0}, 17, {ease: FlxEase.linear});
            tweenCamZoom(0.35, 27, FlxEase.linear);
            triggerEvent('0x939393', '0.001');

        case 247:
            pibbyHealthbar.shader = shader;
            curCameraTarget = 0;
            FlxTween.tween(camHUD, {angle: 0, y: camHUD.y + 300, alpha: 1}, 0.6, {ease: FlxEase.expoOut});

        case 248:
            tweenCamZoom(.4, 0.6, FlxEase.expoIn, true);
            cameraSpeed = 6;
        case 256:
            tweenCamZoom(0.5, 0.7, FlxEase.expoOut);
            cameraSpeed = 3;

        case 512:
            tweenCamZoom(0.4, 0.5, FlxEase.expoOut);
            cameraSpeed = 6;
            glitch.alpha = 1;
            applayShaderToGlitch = true;
            triggerEvent('0xB9FFB9', '0.001');

        case 768:
            tweenCamZoom(0.4, 0.5, FlxEase.expoOut);
            triggerEvent('0x6559AE', '0.001');

        case 770:
            cameraSpeed = 3;

        case 1016:
            tweenCamZoom(.7, 0.6, FlxEase.expoIn, true);

        case 1024:
            tweenCamZoom(0.35, 0.9, FlxEase.expoOut);
            glitch.alpha = 1;
            applayShaderToGlitch = true;
            triggerEvent('0xB9FFB9', '0.001');
            cameraSpeed = 6;

        case 1026:
            defaultCamZoom = 0.35;

        case 1272:
            triggerEvent('0x939393', '0.6');
            FlxTween.tween(glitch, {alpha: 0}, 0.59, {ease: FlxEase.expoIn});
            FlxTween.tween(camGame, {zoom: 0.9}, 0.59, {ease: FlxEase.expoIn});
            applayShaderToGlitch = false;
        case 1274:
            defaultCamZoom = 0.5;

        case 1280:
            defaultCamZoom = 0.4;

        case 1528:
            FlxTween.tween(balck, {alpha: 1}, 0.44, {ease: FlxEase.expoIn});
            tweenCamZoom(.7, 0.59, FlxEase.expoIn);

        case 1536:
            tweenCamZoom(0.7, 0.59, FlxEase.expoOut);
            glitch.alpha = 1;
            balck.alpha = 0;
            applayShaderToGlitch = true;
            triggerEvent('0xB9FFB9', '0.001');

        case 1792:
            triggerEvent('0x939393', '0.6');
            FlxTween.tween(glitch, {alpha: 0}, 0.59, {ease: FlxEase.expoIn});
            tweenCamZoom(.6, 0.59, FlxEase.expoIn);
            applayShaderToGlitch = false;
        case 1816:
            tweenCamZoom(.7, 0.59, FlxEase.expoIn);

        case 1824:
            glitch.alpha = 1;
            triggerEvent('0xB9FFB9', '0.001');
            applayShaderToGlitch = true;
            tweenCamZoom(0.55, 0.59, FlxEase.expoOut);
        case 1902:
            defaultCamZoom = .8;
        case 1912:
            defaultCamZoom = .7;
        case 1915:
            defaultCamZoom = .5;
        case 1920:
            defaultCamZoom = .4;
        case 1983:
            tweenCamZoom(.35, 0.59, FlxEase.expoIn);

        case 2032:
            tweenCamZoom(.8, 0.59, FlxEase.expoIn);

        case 2048:
            triggerEvent('0x6559AE', '0.001');
            glitch.alpha = 1;
            tweenCamZoom(.55, 0.59, FlxEase.expoIn);

        case 2304:
            tweenCamZoom(.8, 0.59, FlxEase.expoIn);
            camHUD.shake(FlxG.random.float(0.025,0.1), FlxG.random.float(0.075,0.125));
            songLength = inst.length;

        case 2303:
            FlxTween.tween(balck, {alpha: 1}, 0.55, {ease: FlxEase.expoIn});
    }
    if (curStep == 1536 || curStep == 1792 || curStep == 1824){
        houseShit = FlxTween.tween(house, {y: house.y-120}, 1, {ease: FlxEase.sineInOut, type: FlxTween.PINGPONG});
        velocityShitHehe = 10;
    }
    if (curStep == 768){
        velocityShitHehe = 1;
    }
    if (curStep == 512 || curStep == 1024){
        velocityShitHehe = 5;
    }
}
