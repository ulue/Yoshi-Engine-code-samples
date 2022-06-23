EngineSettings.middleScroll = false;
var strums = [];
function onGenerateStaticArrows() {
    for(e in PlayState.playerStrums.members) {
        e.x = FlxG.width - ((FlxG.width - e.x) * 0.8);
    }
    for(e in PlayState.cpuStrums.members) {
        e.x *= 0.8;
    }

    PlayState.generateStaticArrows();
    for(i in 0...PlayState_.SONG.keyNumber) {
        var strum = PlayState.cpuStrums.members[i + PlayState_.SONG.keyNumber];
        strum.x = (FlxG.width / 2) + ((i - 2) * (Note.swagWidth * 0.8));
        strums.push(strum);
    }
}
function updatePost(elapsed:Float) {
    EngineSettings.glowCPUStrums = true;
    PlayState.notes.forEach(function(n) {
        if (n.noteType == 1) {
            // gf note
            var strum = PlayState.cpuStrums.members[n.noteData % PlayState_.SONG.keyNumber];
            var nStrum = strums[n.noteData % PlayState_.SONG.keyNumber];
            n.x = n.x - strum.x + nStrum.x;
            n.y = n.y - strum.y + nStrum.y;
        }
    });
}
function onDadHit(note:Note) {
    if (EngineSettings.glowCPUStrums = !(note.noteType == 1)) {
    } else {
        var nStrum = strums[note.noteData % PlayState_.SONG.keyNumber];
        nStrum.cpuRemainingGlowTime = note.stepLength * 1.5 / 1000;
        nStrum.animation.play("confirm", true);
        nStrum.centerOffsets();
        nStrum.centerOrigin();
        nStrum.toggleColor(nStrum.colored);
    }
}
