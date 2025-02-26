importScript("data/scripts/healthbar");

function create(){ 
    boyfriend.cameraOffset.set(-400,-200);
    dad.cameraOffset.set(300,-10);
}
function postCreate(){
    cameraSpeed = 6;
    shader.replacementColour = [0.6, 0.8, 1];
}
var peps = [boyfriend, dad];
function pos(){
    dad.x = -1500;
    dad.y = -1200;
    dad.cameraOffset.set(300,-100);
    dad.color = boyfriend.color = iconP1.color = iconP2.color = 0x6559AE;
    pibbyHealthbar.shader = shader;
    shader.replacementColour = [0.396, 0.349, 0.682];
    change();
}
function change(){
    Thingys.alpha = wall.alpha = floor.alpha = 0.001;
    SadThingys.alpha = Sadwall.alpha = Sadfloor.alpha = 1;
}
var gum:Bool = false;
function events(name){
    switch (name) {
        case "blackout":
            balck.alpha = 1;
        case "blackouttween":
            FlxTween.tween(balck, {alpha: 1}, 0.5, {ease: FlxEase.expoIn});
        case "unblackout":
            FlxTween.tween(balck, {alpha: 0}, 0.1, {ease: FlxEase.expoIn});
        case "focusGum":
            curCameraTarget = 0;
            gum = true;
            defaultCamZoom = camGame.zoom = camera.zoom = .9;
            new FlxTimer().start(.4, function(hello:FlxTimer) {
                gum = false;
                curCameraTarget = 1;
                defaultCamZoom = .7;
            });
    }
}
function postUpdate() if(gum) FlxG.camera.snapToTarget();