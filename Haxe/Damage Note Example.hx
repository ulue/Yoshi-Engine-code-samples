function create() {
    note.frames = Paths.getSparrowAtlas("NOTE_assets_damage");
    switch(note.noteData % 4) {
        case 0:
            // Left note
            note.animation.addByPrefix('scroll', 'purple0', 0);
        case 1:
            // Down note
            note.animation.addByPrefix('scroll', 'blue0', 0);
        case 2:
            // Up note
            note.animation.addByPrefix('scroll', 'green0', 0);
        case 3:
            // Right note
            note.animation.addByPrefix('scroll', 'red0', 0);
    }
    note.animation.addByPrefix('holdend', "hold end");
    note.animation.addByPrefix('holdpiece', "hold piece");
    
    note.setGraphicSize(Std.int(note.width * 0.7));
    note.updateHitbox();
    note.antialiasing = true;
    
    note.colored = false;
    note.splashColor = 0xFF880000;
}

function onPlayerHit() {
    for (bf in PlayState.boyfriends) bf.playAnim("hit", true);
    PlayState.health -= PlayState.maxHealth / 4;
}

function onMiss() {
    
}
