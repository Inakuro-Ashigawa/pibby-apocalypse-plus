import openfl.display.BlendMode;
public var blendshader = new CustomShader('PA+/BlendModes');
var card:FlxSprite;
var card2:FlxSprite;
var curSong = PlayState.instance.curSong.toLowerCase();
var selectedCardImagePath:String = "Extras/Title-Cards/" + curSong;

function postCreate(){
    trace(BlendMode.LIGHTEN);
    card = new FlxSprite().loadGraphic(Assets.getBitmapData(Paths.image(selectedCardImagePath), true, false));
    card2 = new FlxSprite().loadGraphic(Assets.getBitmapData(Paths.image(selectedCardImagePath), true, false));
    card.scrollFactor.set;
    card.alpha = 0;
	card.camera = camCinema;
    card2.camera = camCinema;
    card.screenCenter();
    card2.screenCenter();
    card.scale.set(.3,.3);
    card2.scale.set(.3,.3);
    card2.shader = blendshader;
    card.blend = BlendMode.SUBTRACT;
    //card.blend = 'multiply';
    add(card);
    add(card2);
}

function update(e) 
{
    if (card != null && card2 != null)
    {
    card2.alpha = card.alpha;
    }    
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