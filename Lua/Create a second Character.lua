-- This shows how to add a second dad.
-- You can remove them or add them in the PlayState.dads array like this :
-- If it's a Matt section, remove Shaggy from the PlayState.dads array
-- If it's a Shaggy section, remove Matt from the PlayState.dads array

function createInFront()
    -- 100 is the default dad y
    createClass("secondCharacter", "Character", {100, 100, "your-char"})
    call("PlayState.dads.push", nil, {v("secondCharacter")})
    call("PlayState.add", nil, {v("secondCharacter")})
end