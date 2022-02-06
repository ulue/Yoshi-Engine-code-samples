function create() {
    // If you wanna load a Sparrow Atlas
    var YourSprite = new FlxSprite(0, 0); // Replace 0, 0 by the sprite's position
    var SparrowAtlas = Paths.getSparrowAtlas("path/to/sparrow"); // Replace "path/to/sparrow" by your sparrow path. For example, "stage1/bgPeople" for "images/stage1/bgPeople.png" and "images/stage1/bgPeople.xml"
    YourSprite.frames = SparrowAtlas;
    YourSprite.animation.addByPrefix("Animation Name", "Animation XML Name", 24, true) // Check https://api.haxeflixel.com/flixel/animation/FlxAnimationController.html#addByPrefix
    YourSprite.animation.play("Animation Name");
    PlayState.add(YourSprite);

    // If you wanna load a simple bitmap
    var YourSprite = new FlxSprite(0, 0); // Replace 0, 0 by the sprite's position
    var Bitmap = Paths.image("path/to/bitmap") //  Replace "path/to/image" by your bitmap path. For example, "stage1/bgPeople" for "images/stage1/bgPeople.png"
    YourSprite.loadGraphic(Bitmap); // Loads the Bitmap in the FlxSprite
    PlayState.add(YourSprite); // Adds the sprite to the PlayState
}