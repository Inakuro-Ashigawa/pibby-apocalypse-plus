static var isPlayer:Bool = true;

static var iconP3:HealthIcon;

function postCreate(){    
    iconP3 = new HealthIcon(gf != null && gf.icon!=null?gf.icon:gf.curCharacter, isPlayer);
    iconP3.cameras = [camHUD];
	insert(members.indexOf(iconP1)+1, iconP3);

    if (curSong == "retcon" || curSong == "my-amazing-world"){
        iconP3.setPosition(iconP1.x-20, iconP1.y+10);
        iconP3.scale.set(0.8, 0.8);
        iconP3.origin.set(100,100);
    } else {
        iconP3.setPosition(iconP1.x+350, iconP1.y);
    }
}

function update(elapsed:Float){
    iconP3.health = isPlayer? iconP1.health : iconP2.health;
    iconP3.scale.set(iconP1.scale.x - .4, iconP1.scale.y - .4);
    if (isPlayer){
        if (healthBar.percent < 20){
            if (Options.gameplayShaders) iconP3.shader = glitches;
        } else {
            iconP3.shader = null;
        }
    } else {
        if (healthBar.percent > 80){
            if (Options.gameplayShaders) iconP3.shader = glitches;
        } else {
            iconP3.shader = null;
        }
    }
}