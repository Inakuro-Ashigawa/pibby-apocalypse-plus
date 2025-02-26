
function postCreate(){

    remove(nhcutscene);
    nhcutscene.cameras = [camHUD];
    nhcutscene.scrollFactor.set();
    nhcutscene.active = false;
    insert(members.indexOf(iconP1)+2, nhcutscene);

    hudTxt.visible = false;
}
function onSongStart(){
    nhcutscene.active = true;
}
function stepHit(){
    if (curStep == 32){
        nhcutscene.alpha = 0.0001;
    }
    if (curStep == 464){
        bg.alpha = 0.0001;
        bgNh.alpha = 1;
    }
    if (curStep == 592){
        bg.alpha = 1;
        bgNh.alpha = 0.0001;
    }
}