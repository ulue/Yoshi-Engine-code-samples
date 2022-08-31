import openfl.utils.Assets;
var coolShader = new CustomShader(Paths.shader("scroll"));
function create() {
    coolShader.data.donkey.input = Assets.getBitmapData(Paths.image("donke"));
    FlxG.camera.addShader(coolShader);
}

function update(elapsed:Float) {
    coolShader.data.time.value = [curDecBeat / 8];
}