var keyNum = 4;

function createPost() {
    for(note in unspawnNotes) {
        note.noteData %= PlayState._SONG.keyNumber;
        if (!note.mustPress) {
            note.noteData += PlayState._SONG.keyNumber;
        }
        note.mustPress = true;
    }
    keyNum = PlayState._SONG.keyNumber;
    PlayState.SONG.keyNumber *= 2;
    PlayState._SONG.keyNumber *= 2;

    for(n in noteScripts) {
        // is hscript script
        if (n.hscript != null) {
            var dadFunc = n.getVariable("onDadHit");
            var playerFunc = n.getVariable("onPlayerHit");
            if (dadFunc == null) dadFunc = function() {};
            if (playerFunc == null) playerFunc = function() {};

            n.setVariable("onPlayerHit", function(direction) {
                direction %= keyNum;
                if (n.getVariable("note").noteData >= keyNum) {
                    dadFunc(direction);
                } else {
                    playerFunc(direction);
                }
            });

            var updateFunc = n.getVariable("update");
            if (updateFunc == null) updateFunc = function(elapsed) {};
            n.setVariable("update", function(elapsed:Float) {
                var note = n.getVariable("note");
                if (note.noteData >= 4) {
                    note.mustPress = false;
                }
                updateFunc(elapsed);
                note.mustPress = true;
            });

            var updatePostFunc = n.getVariable("updatePost");
            if (updatePostFunc == null) updatePostFunc = function(elapsed) {};
            n.setVariable("updatePost", function(elapsed:Float) {
                var note = n.getVariable("note");
                if (note.noteData >= 4) {
                    note.mustPress = false;
                }
                updatePostFunc(elapsed);
                note.mustPress = true;
            });
        }
    }
}

function onStrums() {
    for(e in cpuStrums.members) {
        e.isCpu = false;
        e.ID += keyNum;
        playerStrums.add(e);
    }
}
function destroy() {
    PlayState._SONG.keyNumber = keyNum;
}

function onKeyShit(pressedArray, justPressedArray, justReleasedArray) {
    FlxG.keys.lastHit.clear();
    for(array in [pressedArray, justPressedArray, justReleasedArray]) {
        var buffer = [];
        for(i in 0...keyNum) {
            buffer.push(array.shift());
        }
        for(e in buffer) array.push(e);
    }
}