-- Check the Lua documentation for more info
-- https://github.com/YoshiCrafter29/YoshiEngine/blob/main/documentation/doc/lua.md

function create()
    -- If you wanna load a Sparrow Atlas
    createClass("YourSprite", "FlxSprite", {0, 0}) -- Replace 0, 0 by the sprite's position

    call("Paths.getSparrowAtlas", "SparrowAtlas", {"path/to/sparrow"}) -- Replace "path/to/sparrow" by your sparrow path. For example, "stage1/bgPeople" for "images/stage1/bgPeople.png" and "images/stage1/bgPeople.xml"
    set("YourSprite.frames", v("SparrowAtlas")) -- Sets the frames
    call("YourSprite.animation.addByPrefix", nil, {"Animation Name", "Animation XML Name", 24, true}) -- Check https://api.haxeflixel.com/flixel/animation/FlxAnimationController.html#addByPrefix
    call("YourSprite.animation.play", nil, {"Animation Name"})
    call("PlayState.add", {v("YourSprite")}) -- Adds the sprite to the PlayState

    -- If you wanna load a simple bitmap
    createClass("YourSprite", "FlxSprite", {0, 0}) -- Replace 0, 0 by the sprite's position

    call("Paths.image", "Bitmap", {"path/to/bitmap"}) -- Replace "path/to/image" by your bitmap path. For example, "stage1/bgPeople" for "images/stage1/bgPeople.png"
    call("YourSprite.loadGraphic", nil, {v("Bitmap")}) -- Loads the bitmap in the FlxSprite
    call("PlayState.add", {v("YourSprite")}) -- Adds the sprite to the PlayState
end