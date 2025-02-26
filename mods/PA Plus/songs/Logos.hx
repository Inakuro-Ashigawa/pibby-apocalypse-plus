import flixel.FlxCamera;
public var camCinema:FlxCamera;
public var camHUD2:FlxCamera;
public var Aslogo:FlxSprite;
public var balck:FlxSprite;
function create(){
    FlxG.cameras.remove(camHUD, false);
	FlxG.cameras.add(camCinema = new FlxCamera(), false);
	camCinema.bgColor = 0;
    FlxG.cameras.add(camHUD, false);
    
	FlxG.cameras.add(camHUD2 = new FlxCamera(), false);
	camHUD2.bgColor = 0;

    balck = new FlxSprite().makeGraphic(100000, 10000, 0xFF000000);
	balck.screenCenter();
	balck.camera = camCinema;
	balck.alpha = 0;
    add(balck);
}
function postCreate(){
    Aslogo = new FunkinSprite(450,510);
    Aslogo.loadGraphic(Paths.image("extras/AS-icon"));
    Aslogo.setGraphicSize(Std.int(Aslogo.width * 0.12));
    Aslogo.scrollFactor.set();
    Aslogo.alpha = 0.5;
    add(Aslogo);
        
    Aslogo.cameras = [camHUD2];
    Aslogo.zoomFactor = 0;
    if (downscroll){
        Aslogo.y -= 630;
    } else {
        Aslogo.y = 510;
    }
}
function postUpdate(){
    camCinema.scroll = camHUD.scroll;
    camCinema.zoom = 1;
}