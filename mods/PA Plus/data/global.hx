import flixel.FlxG;
import flixel.FlxCamera;
import flixel.FlxBasic;
import lime.app.Application;


public static var camMargin:FlxCamera;
function preStateSwitch() 
{
    initMarginCamera();
}

public function initMarginCamera()
    {
        camMargin = new FlxCamera();
        FlxG.signals.gameResized.add((w, h) -> camMargin.setSize(Application.current.window.width, Application.current.window.height));
        trace("Cam made");
        camMargin.bgColor = 0xFF502A69;
        trace("white");
        FlxG.cameras.add(camMargin, false);
        trace("added");
        FlxG.game.parent.removeChild(camMargin.flashSprite);
        trace("remove");
        FlxG.game.parent.addChildAt(camMargin.flashSprite, 0);
        trace("set to back");
    }