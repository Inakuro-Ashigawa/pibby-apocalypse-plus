import flixel.FlxG;
import openfl.system.System;
import flixel.text.FlxTextBorderStyle;
import funkin.backend.system.framerate.Framerate;
import flixel.text.FlxText;
import flixel.util.FlxMath;
import flixel.util.FlxColor;

// FPS variables
var finalFPS:Float = 0;
public var camFPS:FlxCamera = null;
public var fpsfunniCounter:FlxText;
public static var fontShit:String = "menuFont";
var cacheCount:Int;
var currentTime:Float;
var times:Array<Float>;

function postStateSwitch() {
	FlxG.cameras.add(camFPS = new HudCamera(), false);
	camFPS.bgColor = 0;
	fpsfunniCounter = new FlxText(10, 10, 400);
	fpsfunniCounter.setFormat(Paths.font(fontShit) + ".ttf", 15, FlxColor.WHITE, 'left', FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
	fpsfunniCounter.antialiasing = true;
	fpsfunniCounter.scrollFactor.set();
	fpsfunniCounter.cameras = [camFPS];
	if(!FlxG.save.data.teaser) FlxG.state.add(fpsfunniCounter);
	cacheCount = 0;
	currentTime = 0;
	times = [];
	finalFPS = 0;
	Framerate.fpsCounter.visible = false;
	Framerate.memoryCounter.visible = false;
	Framerate.codenameBuildField.visible = false;
}

function update(elapsed:Float) {
	finalFPS = CoolUtil.fpsLerp(finalFPS, FlxG.elapsed == 0 ? 0 : (1 / FlxG.elapsed), 0.25);
    var MFPS = Std.string(Math.floor(finalFPS));

	var memoryMegas:Float = Math.abs(FlxMath.roundDecimal(System.totalMemory / 1000000, 1));
	fpsfunniCounter.text = "FPS: " + MFPS + " - Memory: " + memoryMegas + " MB";
	

	if (memoryMegas >= 3000 || finalFPS <= FlxG.save.data.Framerate / 2)
		fpsfunniCounter.color = 0xFFe30000; 
	else
		fpsfunniCounter.color = FlxColor.WHITE;

	if (FlxG.keys.justPressed.F5)
		FlxG.resetState();
}