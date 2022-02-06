local angle = 0
local x = 0
local mode = 0
function update(elapsed)
    getArray("PlayState.playerStrums.members", 0, "strum1");
    getArray("PlayState.playerStrums.members", 1, "strum2");
    getArray("PlayState.playerStrums.members", 2, "strum3");
    getArray("PlayState.playerStrums.members", 3, "strum4");
    if x == 0 then
        x = get("strum1.x")
    end
    
    angle = angle + (math.pi * elapsed)
    local noteSwagWidth = get("Note.swagWidth")

    if mode == 0 then
        set("strum1.x", x + (noteSwagWidth * 0) + (math.sin(angle + (math.pi * 0.25 * 1))) * (noteSwagWidth / 2))
        set("strum2.x", x + (noteSwagWidth * 1) + (math.sin(angle + (math.pi * 0.25 * 2))) * (noteSwagWidth / 2))
        set("strum3.x", x + (noteSwagWidth * 2) + (math.sin(angle + (math.pi * 0.25 * 3))) * (noteSwagWidth / 2))
        set("strum4.x", x + (noteSwagWidth * 3) + (math.sin(angle + (math.pi * 0.25 * 4))) * (noteSwagWidth / 2))
    elseif mode == 1 then
        set("strum1.x", x + (noteSwagWidth * 2) + (math.sin(angle + (math.pi * 0.25 * 1))) * (noteSwagWidth * 1.5))
        set("strum2.x", x + (noteSwagWidth * 2) + (math.sin(angle + (math.pi * 0.25 * 2))) * (noteSwagWidth * 1.5))
        set("strum3.x", x + (noteSwagWidth * 2) + (math.sin(angle + (math.pi * 0.25 * 3))) * (noteSwagWidth * 1.5))
        set("strum4.x", x + (noteSwagWidth * 2) + (math.sin(angle + (math.pi * 0.25 * 4))) * (noteSwagWidth * 1.5))
    end
end

function beatHit(curBeat)
    if curBeat % 4 == 0 then
        mode = (mode + 1) % 2
    end
end