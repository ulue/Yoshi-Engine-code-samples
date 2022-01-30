// MP4 Cutscene file example
// ALREADY BUILT IN, CHECK THE "Yoshi Engine" MOD !

function create() {
    var wasWidescreen = PlayState.isWidescreen;

    var videoSprite:FlxSprite = null;
    videoSprite = MP4Video.playMP4(
        // VIDEO NAME IN THE videos FOLDER
        Paths.video("video-name"),
        function() {
            PlayState.remove(videoSprite);
            PlayState.isWidescreen = wasWidescreen;
            startCountdown();
        },
        // IF MIDSONG
        false);
    videoSprite.cameras = [PlayState.camHUD];
    videoSprite.scrollFactor.set();
    PlayState.isWidescreen = false;
    PlayState.add(videoSprite);
}