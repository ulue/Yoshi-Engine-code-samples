// originally made for https://twitter.com/YoshiCrafter29/status/1518542794087931904
// no bugs known, but can't do two notes at once

// dont forget to move the "boom.ogg" in your "sounds" folder and the "boom.frag" in your "shaders" folder.

import("openfl.filters.ShaderFilter");

var boomTime:Float = -5000;
var boomActive = false;
var boomDefaultX:Float = 0;
var boomDefaultY:Float = 0;
var boomDirectionX:Float = -1;
var boomDirectionY:Float = -1;
var audioPlayed:Bool = false;
var audio:FlxSound;

var shaders:Array<CustomShader> = [];

function create() {
    audio = new FlxSound().loadEmbedded(Paths.sound('boom'));
    applyShaderToCam(PlayState.camHUD);
    applyShaderToCam(FlxG.camera);
}

function onDadHit(note:Note) {
    if (boomActive) return;
    boomTime = note.strumTime;
    boomDefaultX = PlayState.dad.x - 400;
    boomDefaultY = PlayState.dad.y - 130;
    audioPlayed = false;
    if (note.noteData % 4 == 0) {
        boomDirectionX = -1;
        boomDirectionY = 0;
    } else if (note.noteData % 4 == 2) {
        boomDirectionX = 0;
        boomDirectionY = -1;
    }
    else if (note.noteData % 4 == 3) {
        boomDirectionX = 1;
        boomDirectionY = 0;
    }
    else {
        boomDirectionX = 0;
        boomDirectionY = 0;
    };
    boomActive = true;
}

function update(elapsed:Float) {
    PlayState.camFollow.setPosition(PlayState.boyfriend.getMidpoint().x - 100 + PlayState.boyfriend.camOffset.x, PlayState.boyfriend.getMidpoint().y - 100 + PlayState.boyfriend.camOffset.y);

    if (boomActive) {
        if (Conductor.songPosition < boomTime + Conductor.crochet) {
            PlayState.dad.x = 400 + FlxMath.lerp(boomDefaultX, 2000 * boomDirectionX, FlxEase.quartIn((Conductor.songPosition - boomTime) / Conductor.crochet));
            PlayState.dad.y = 130 + FlxMath.lerp(boomDefaultY, 2000 * boomDirectionY, FlxEase.quartIn((Conductor.songPosition - boomTime) / Conductor.crochet));
        } else if (Conductor.songPosition < boomTime + (Conductor.crochet * 2)) {
            if (!audioPlayed) {
                PlayState.camHUD.zoom *= 1.33;
                FlxG.camera.zoom *= 1.33;
                audio.volume = 1; // for update shit
                audio.play(true);
                audioPlayed = true;
            }
            for(s in shaders) {
                s.shaderData.strength.value = [FlxMath.lerp(0.035, 0, FlxEase.smoothStepOut((Conductor.songPosition - (boomTime + Conductor.crochet)) / Conductor.crochet))];
                
            }
        } else {
            boomActive = false;
            for(s in shaders) {
                s.shaderData.strength.value = [0];
            }
        }
    }
}

function applyShaderToCam(camera) {
    var shader = new CustomShader(mod + ":boom");
    shaders.push(shader);
    camera.setFilters([new ShaderFilter(shader)]);
    camera.filtersEnabled = true;
}