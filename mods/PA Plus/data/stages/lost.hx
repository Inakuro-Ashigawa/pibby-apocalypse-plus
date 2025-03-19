var RainTime = 0;
var rain = new CustomShader('rain');
function update(elapsed){
    RainTime += elapsed;
    rain.iTime = RainTime;
    rain.iIntensity = FlxG.random.float(.1, 12);
    rain.iTimescale = FlxG.random.float(1, 5);
}
function postCreate(){
    for (i in [iconP1,iconP2]) i.alpha = 0.0001;
    for (i in [timeTxt, timeBar, timeBarBG,healthBar,healthBarBG]) remove(i);
}
function bgSwich(){
    camGame.addShader(rain);
    goodbg.alpha = goodhills.alpha = goodground.alpha = goodtress.alpha = 0.001;
    badbg.alpha = badhills.alpha = badfire.alpha = badground.alpha = badtress.alpha = 1;
}
function onCameraMove(e){
    switch(curCameraTarget){
        case 0:
            defaultCamZoom = 0.9;
        case 1:
            defaultCamZoom = 1.1;
    }
}