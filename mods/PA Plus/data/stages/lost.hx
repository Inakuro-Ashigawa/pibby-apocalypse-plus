import flixel.addons.effects.FlxTrail;
import openfl.display.BlendMode;
import funkin.backend.utils.NdllUtil;

var ShaderTime = 0;
public var cameraSpeed = 0.01;
//temp
var rain = new CustomShader('rain');
var fire = new CustomShader('PA+/budgetfire');
public var blendshader = new CustomShader('PA+/BlendModes');
var shaderlayer:FunkinSprite;

function update(elapsed)
{
    FlxG.camera.followLerp = cameraSpeed;
    ShaderTime += elapsed;
    rain.iTime = ShaderTime;
    fire.iTime = ShaderTime;
    rain.iTimescale = FlxG.random.float(1, 5);
}
function postCreate()
{
    //RAAAAAA
    //fire.distortTexture.input = BitmapData.fromFile('shader/noise');
    trail = new FlxTrail(dad, null, 50, 15, 0.5, 0.059);
    insert(members.indexOf(dad), trail);
    //trail.blend = BlendMode.DIFFERENCE;
    trail.camera = camGame;
    trail.color = 0x727272;
    shaderlayer = new FunkinSprite().makeSolid(FlxG.width, FlxG.height, 0);
    shaderlayer.setGraphicSize(Std.int(shaderlayer.width * 1.62));
    insert(members.indexOf(goodground), shaderlayer);
    shaderlayer.shader = fire;
    rain.iIntensity = 0;
    for (i in [iconP1,iconP2]) i.alpha = 0.0001;
    for (i in [timeTxt, timeBar, timeBarBG,healthBar,healthBarBG]) remove(i);
}
function bgSwich()
{
    camGame.addShader(rain);
    FlxTween.tween(rain, {iIntensity: 0.5}, 40, {ease: FlxEase.linear});
}
// get it cause i peed i mean what
function sPEED(a:Float) 
{
    a = cameraSpeed;
}
function stepHit() 
{
    switch(curStep)
    {
        case 123: 
            trace("123 count with me");
            cameraSpeed = 0.15;
            //sPEED(0.15);
    }
}
function onCameraMove(e)
{
    switch(curCameraTarget)
    {
        case 0:
            defaultCamZoom = 0.9;
        case 1:
            defaultCamZoom = 1.1;
    }
}