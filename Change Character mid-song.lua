function createInFront()
    get("PlayState.dad", "oldCharacter")

    createClass("newCharacter", "Character", {100, 100, "your-char"})
    set("newCharacter.visible", false)
    call("PlayState.dads.push", nil, {v("newCharacter")})
    call("PlayState.add", nil, {v("newCharacter")})
end

function beatHit(curBeat)
    -- Replace 150 by whatever beat you want the character to change to
    if curBeat == 150 then
        set("oldCharacter.visible", false)
        set("newCharacter.visible", true)
    end
end