// might break sometimes lol
// originally made for https://twitter.com/YoshiCrafter29/status/1518294219965800449

var from = {x: 0, y: 0, angle: 0, time:0};
var to = {x: 0, y: 0, angle: 0, time:0};
var currentNote:Note = null;
var jumpingNote:FlxSprite;
var coloredJumpingNote:FlxSprite;
var add360:Bool = false;
var str = null;
var e = false;

function createPost() {
    from.x = PlayState.guiSize.x / 2;
    from.y = PlayState.guiSize.y / 2;

    for(s in PlayState.playerStrums.members) s.notes_alpha = 0;
    for(s in PlayState.cpuStrums.members) s.notes_alpha = 0;

    jumpingNote = new FlxSprite(from.x, from.y);
    jumpingNote.frames = Paths_.getSparrowAtlas("NOTE_assets_colored", "mods/Friday Night Funkin'");
    jumpingNote.animation.addByPrefix("arrow", "greennn", 1, true);
    jumpingNote.animation.play("arrow");
    jumpingNote.scale.set(0.7, 0.7);
    jumpingNote.updateHitbox();
    jumpingNote.antialiasing = true;
    jumpingNote.cameras = [PlayState.camHUD];
    jumpingNote.shader = new ColoredNoteShader(255, 255, 255, false, 0);

    coloredJumpingNote = new FlxSprite(from.x, from.y);
    coloredJumpingNote.frames = Paths_.getSparrowAtlas("NOTE_assets_colored", "mods/Friday Night Funkin'");
    coloredJumpingNote.animation.addByPrefix("arrow", "greennn", 1, true);
    coloredJumpingNote.animation.play("arrow");
    coloredJumpingNote.scale.set(0.7, 0.7);
    coloredJumpingNote.updateHitbox();
    coloredJumpingNote.antialiasing = true;
    coloredJumpingNote.cameras = [PlayState.camHUD];
    coloredJumpingNote.shader = new ColoredNoteShader(255, 255, 255, false, 0);
    coloredJumpingNote.alpha = 0;

    PlayState.add(jumpingNote);
    PlayState.add(coloredJumpingNote);
}

function update(elapsed:Float) {
    PlayState.notes.members.sort(function(a, b) {
        if (a.strumTime < b.strumTime) return -1;
        else if (a.strumTime > b.strumTime) return 1;
        else return 0;
    });
    // PlayState.camHUD.zoom = 0.2;
    if (PlayState.notes.members.length <= 0) {
        jumpingNote.visible = false;
    } else {
        
        jumpingNote.visible = true && e;
        if (currentNote != PlayState.notes.members[0]) {
            var c = new FlxColor(currentNote == null ? 0xFFFFFFFF : currentNote.splashColor);

            coloredJumpingNote.shader.setColors(c.red, c.green, c.blue);
            coloredJumpingNote.alpha = 1;
            from.x = to.x;
            from.y = to.y;
            from.angle = to.angle;
            if (currentNote != null) {
                from.time = currentNote.strumTime;
            }
            currentNote = PlayState.notes.members[0];
            add360 = !add360;
            var dir = currentNote.noteData % PlayState.playerStrums.length;
            str = currentNote.mustPress ? PlayState.playerStrums.members[dir] : PlayState.cpuStrums.members[dir];
            to.x = str.x;
            to.y = str.y;
            var angle = 0;
            if (dir == 0) angle = -90;
            if (dir == 1) angle = 180;
            if (dir == 3) angle = 90;
            to.angle = angle + (add360 ? 360 : -360);
            to.time = currentNote.strumTime;
            e = true;
        }
        var diff = to.time - from.time;
        var addY = (-Math.cos((Conductor.songPosition - from.time) / diff * Math.PI * 2) + 1) * (EngineSettings.downscroll ? -200 : 200);
        
        jumpingNote.x = FlxMath.lerp(from.x, to.x, (Conductor.songPosition - from.time) / diff);
        jumpingNote.y = FlxMath.lerp(from.y, to.y, (Conductor.songPosition - from.time) / diff) + addY;
        jumpingNote.angle = FlxMath.lerp(from.angle, to.angle, (Conductor.songPosition - from.time) / diff);
        coloredJumpingNote.x = jumpingNote.x;
        coloredJumpingNote.y = jumpingNote.y;
        coloredJumpingNote.angle = jumpingNote.angle;
    }
    coloredJumpingNote.alpha = FlxMath.lerp(coloredJumpingNote.alpha, 0, 0.125 * elapsed * 60);
}