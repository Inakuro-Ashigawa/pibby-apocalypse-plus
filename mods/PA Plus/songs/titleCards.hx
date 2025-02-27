import openfl.display.BlendMode;

var card:FlxSprite;
var curSong = PlayState.instance.curSong.toLowerCase();
var selectedCardImagePath:String = "Extras/Title-Cards/" + curSong;
function postCreate(){
    card = new FlxSprite().loadGraphic(Paths.image(selectedCardImagePath));
    card.scrollFactor.set;
    card.alpha = 0;
	card.camera = camCinema;
    card.screenCenter();
    card.scale.set(.3,.3);
    card.blend = "multiply";
    add(card);
}
function showTitleCard(){
    trace("Worked");
    FlxTween.tween(card, {alpha: 1}, 1.5, {ease: FlxEase.linear});
    new FlxTimer().start(1, function(hello:FlxTimer) {
        glitchOut(card);
    });
}
function glitchOut(spr:FlxSprite, dontKill:Bool=false){
    if (!dontKill) {
        new FlxTimer().start(3, function(timer:FlxTimer) {
            FlxTween.tween(card, {alpha: 0}, .5, {ease: FlxEase.linear});
        });
    }
}
//ok but like why it needs to be like same color
//function update() card.color = dad.color;