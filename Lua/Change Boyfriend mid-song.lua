function createInFront()
    get("PlayState.boyfriend", "oldCharacter")

    createClass("newCharacter", "Boyfriend", {770, 100, "your-bf"})
    set("newCharacter.visible", false)
    call("PlayState.boyfriends.push", nil, {v("newCharacter")})
    call("PlayState.add", nil, {v("newCharacter")})
end

function beatHit(curBeat)
    -- Replace 150 by whatever beat you want the boyfriend to change to
    if curBeat == 150 then
        set("oldCharacter.visible", false)
        set("newCharacter.visible", true)
    end
end