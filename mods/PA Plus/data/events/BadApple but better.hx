import openfl.geom.ColorTransform;

var bAbg = new FunkinSprite();
var colouredBar = (dad != null && dad.xml != null && dad.xml.exists("color")) ? CoolUtil.getColorFromDynamic(dad.xml.get("color")) : 0xFFFFFFFF;
var colouredBarB = (boyfriend != null && boyfriend.xml != null && boyfriend.xml.exists("color")) ? CoolUtil.getColorFromDynamic(boyfriend.xml.get("color")) : 0xFFFFFFFF;
var colouredBarG = (gf != null && gf.xml != null && gf.xml.exists("color")) ? CoolUtil.getColorFromDynamic(gf.xml.get("color")) : 0xFFFFFFFF;
function postCreate(){
	for (event in events) {
		if (event.name == 'BadApple but better') {
            bAbg.makeSolid(FlxG.width+10, FlxG.height+12, event.params[2]);
            bAbg.zoomFactor = 0;
            bAbg.scrollFactor.set();
            bAbg.screenCenter();
            bAbg.alpha = 0.0001;
            if(gf != null) {
                insert(members.indexOf(gf), bAbg); 
            }else{ 
                insert(members.indexOf(dad), bAbg); 
            }
        }
    }
}
function onEvent(e) {
    if (e.event.name == "BadApple but better"){
        if (e.event.params[0] == true || e.event.params[0] == null){
            bAbg.alpha = 1;
            bloom.size = 60;
            bAbg.colorTransform.color = FlxColor.BLACK;
            inten = 0.02;

            for (bfs in strumLines.members[1].characters) bfs.colorTransform.color = colouredBarB;
            for (dads in strumLines.members[0].characters) dads.colorTransform.color = colouredBar;
            if(gf != null){  
                for (gfs in strumLines.members[2].characters) gfs.colorTransform.color = colouredBarG;
            }
        } else {
            bAbg.alpha = 0.0001;
            bloom.size = 20;
            inten = 0.01;
            for (bfs in strumLines.members[1].characters) bfs.setColorTransform();
            for (dads in strumLines.members[0].characters) dads.setColorTransform();
            if(gf != null){ 
                for (gfs in strumLines.members[2].characters) gfs.setColorTransform();
            }
        }
    }
}
var isWhiteBgMode:Bool = false; 

function addCameraZooms(zummyzumzum:Float) {
    camGame.flash(FlxColor.BLACK, 0.5);
    isWhiteBgMode = !isWhiteBgMode;

    if (isWhiteBgMode) {
        bAbg.alpha = 1; 
        bAbg.colorTransform.color = FlxColor.WHITE; 

        for (bfs in strumLines.members[1].characters) {
            bfs.colorTransform.color = FlxColor.BLACK;
        }
        for (dads in strumLines.members[0].characters) {
            dads.colorTransform.color = FlxColor.BLACK;
        }
        if (gf != null) {
            for (gfs in strumLines.members[2].characters) {
                gfs.colorTransform.color = FlxColor.BLACK;
            }
        }
    } else {
        bAbg.alpha = 0.0001; 
        bAbg.colorTransform.color = FlxColor.BLACK; 
        for (bfs in strumLines.members[1].characters) {
            bfs.colorTransform.color = colouredBarB;
        }
        for (dads in strumLines.members[0].characters) {
            dads.colorTransform.color = colouredBar;
        }
        if (gf != null) {
            for (gfs in strumLines.members[2].characters) {
                gfs.colorTransform.color = colouredBarG;
            }
        }
    }
}