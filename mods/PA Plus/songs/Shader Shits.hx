// Inakuro & NotBeep!!! :>
public var keepShader:Bool = false;
public var Invert = new CustomShader('INV');
public var funnidumb = new CustomShader('vcr');
public var bloom = new CustomShader('Pibbey/bloom');
public var glitches = new CustomShader("Pibbey/Glitch");
public var distorDad = new CustomShader("Pibbey/distortShader");
public var aberration = new CustomShader('Pibbey/chromaticAberration');
var defaultOppX = [];
var defaultPlayX = [];
var data:Map<Int, {lastNote:{time:Float, id:Int}}> = [];

function postCreate(){
    if(FlxG.save.data.teaser) player.cpu = true;
    if (Options.gameplayShaders) {
        initializeStrumShaders();
        setGeneralIntensity(0.001);
        applyShadersToCamera();
        configurePibbyShader();
    }
    health = 2;
    initializeStrumPositions();
    initializeDataForStrumLines();
}
var GlitchFloat1;
var GlitchFloat2;
function initializeCharShaders() {
    switch (dad.curCharacter) {
        case "finn-R","gumballnocorrupt","skibidi-finn","jake":
            GlitchFloat1 = FlxG.random.float(1, 2);
            GlitchFloat2 = FlxG.random.float(-1, -0.5);
        case "gumball":
            GlitchFloat1 = FlxG.random.float(-10, -5);
            GlitchFloat2 = FlxG.random.float(1, 2);
    }
}
function initializeStrumShaders() {
    for (i in cpuStrums.members) {
        switch (curSong) {
            case "":
                i.shader = null;
                continue;
            default:
                i.shader = glitches;
        }
    }
}
function applyShadersToCamera() {
    camGame.addShader(aberration);
    camHUD.addShader(aberration);
    camGame.addShader(bloom);
}

function configurePibbyShader() {
    bloom.size = 20;
}
public var strengthVal:Float = .2;
function initializeStrumPositions() {
    for (i in cpuStrums.members) {
        defaultOppX.push(i.x);
    }
    for (i in playerStrums.members) {
        defaultPlayX.push(i.x);
    }
}
function initializeDataForStrumLines() {
    for (sl in strumLines.members) {
        data[strumLines.members.indexOf(sl)] = {
            lastNote: { time: -9999, id: -1 }
        };
    }
}
var intensity:Float = 0;
public function setGeneralIntensity(val:Float) {
    intensity = val;
    aberration.redOff = [intensity, 0];
    aberration.blueOff = [-intensity, 0];
}
function onGameOver() {
    camGame.removeShader(aberration);
    camGame.removeShader(bloom);
}

function stepHit() if (Options.gameplayShaders) glitches.binaryIntensity = FlxG.random.float(1, 10);

public var inten = 0.01;
function beatHit(curBeat:Float) {
    if (camZooming && curBeat % camZoomingInterval == 0 && Options.gameplayShaders) {
        setGeneralIntensity(inten);
    }
}
static var glitchTime:Float = 0;
static var glitchTimeValue:Float = 0;
var distorShit:Float = 0;
var crt = 0;
function update(elapsed){
    crt += elapsed;
    funnidumb.iTime = crt;
    funnidumb.strengthMulti = strengthVal;
    if (Options.gameplayShaders){
        if (camZooming && intensity > 0.0005) setGeneralIntensity(intensity - 0.001);

            distorShit -= elapsed;
            if(distorShit <= 0) {
                distorShit = 0;
                if (dad.shader == distorDad || dad.shader == glitches) dad.shader = null;
                if (gf != null ){
                    if(gf.shader == distorDad || gf.shader == glitches) gf.shader = null;
                }
            }
        if (healthBar.percent < 20){
            iconP1.shader = glitches;
        } else {
            iconP1.shader = null;
        }
        if (healthBar.percent > 80){
            iconP2.shader = glitches;
        } else {
            iconP2.shader = null;
        }
        initializeCharShaders();
        distorDad.negativity = (100/1000) + GlitchFloat1;
    }
}
var lastNote;
var inver:Int = .4;
public var dord = true;
public var glitching:Bool = false;
function onDadHit(note:NoteHitnote) {
    switch (dad.curCharacter) {
        case "gumball":
        for (i in 0...cpuStrums.length) {
            cpuStrums.members[i].x = defaultOppX[i] + FlxG.random.int(-8, 8);
            cpuStrums.members[i].y = 50 + FlxG.random.int(-8, 8);
        }
        if (health > 0.2) {
            health -= FlxG.random.float(0.01, 0.09);
        }
    }
}
function onNoteHit(note){
    var curNotes = note.noteType;

    if (Options.gameplayShaders && curNotes == "Glitch Note2") {
        distorShit = .6;
        glitching = !glitching;
        if (!note.note.isSustainNote){
            distorDad.binaryIntensity = FlxG.random.float(-1, -0.5);

            gf.shader = distorDad;
            distorDad.glitchShift = FlxG.random.float(-1, -0.5);
            
            distorDad.negativity = (1000) + FlxG.random.float(1.0, 2.0);
        }
    }
    
    if (Options.gameplayShaders && curNotes == "Glitch Note") {
        distorShit = .3;
        glitching = !glitching;
        distorDad.binaryIntensity = GlitchFloat2;
        dad.shader = distorDad;
        if (health > 0.2) {
            health -= FlxG.random.float(0.1, 0.01);
        }
    }
}
public var disableCamMove:Bool = false;
var angleCamVar:Float = 0;
public var CameraSpeed = camera.followLerp;
function postUpdate(elapsed){
    var angleLerp:Float = FlxMath.bound(FlxMath.bound(elapsed * 2.4 / 0.4, 0, 1) + CameraSpeed * 1 / 5, 0, 1);

    if (curCameraTarget == null || curCameraTarget == -1 || disableCamMove) return;
        switch (strumLines.members[curCameraTarget].characters[0].getAnimName()) {
            case "singLEFT", "singLEFT-alt": 
                angleCamVar = -20/30;
            case "singRIGHT", "singRIGHT-alt": 
                angleCamVar = 20/30;
    }
    if (angleCamVar != 0) angleCamVar = (lerp(angleCamVar, 0, angleLerp));
    camera.angle = (lerp(camera.angle, 0 + angleCamVar, angleLerp));
    if(FlxG.save.data.teaser) camHUD.alpha = 0.001;
}