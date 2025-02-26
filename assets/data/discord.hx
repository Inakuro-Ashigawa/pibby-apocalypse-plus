import funkin.backend.utils.DiscordUtil;

function onGameOver() {
	DiscordUtil.changePresence('Everything is over...', PlayState.SONG.meta.displayName + "... Just stop...");
}

function onDiscordPresenceUpdate(e) {
	var data = e.presence;

	if(data.button1Label == null)
		data.button1Label = "Come join Us...";
	if(data.button1Url == null)
		data.button1Url = "https://discord.gg/tNPqJnZP";
}

function onPlayStateUpdate() {
	DiscordUtil.changeSongPresence(
		PlayState.instance.detailsText +,
		(PlayState.instance.paused ? "Paused... - " : "") + PlayState.SONG.meta.displayName,
		PlayState.instance.inst +,
		PlayState.instance.getIconRPC() 
	);
}

function onMenuLoaded(name:String) {
	DiscordUtil.changePresenceSince("In the Menus... or are we?", null);
}

function onEditorTreeLoaded(name:String) {
	switch(name) {
		case "Character Editor":
			DiscordUtil.changePresenceSince("Choosing a Character... or erasing them?", null);
		case "Chart Editor":
			DiscordUtil.changePresenceSince("Choosing a Chart... The notes won't stop...", null);
		case "Stage Editor":
			DiscordUtil.changePresenceSince("Choosing a Stage... the world is collapsing...", null);
	}
}

function onEditorLoaded(name:String, editingThing:String) {
	switch(name) {
		case "Character Editor":
			DiscordUtil.changePresenceSince("Editing a Character... Are you sure you want to?", editingThing);
		case "Chart Editor":
			DiscordUtil.changePresenceSince("Editing a Chart... Glitching in progress...", editingThing);
		case "Stage Editor":
			DiscordUtil.changePresenceSince("Editing a Stage... Or breaking it?", editingThing);
	}
}
