// Sample on how to change your character midsong :

// Old character (first character)
var oldCharacter:Boyfriend = null;
var newCharacter:Boyfriend = null;

function createInFront() {
    // Sets the old boyfriend as the current boyfriend.
    oldCharacter = PlayState.boyfriend;

    newCharacter = new Boyfriend(770, 100, "your-char");
    // Hides the new boyfriend
    newCharacter.visible = false;
    PlayState.boyfriends.push(newCharacter);
    PlayState.add(newCharacter);
}

function beatHit(curBeat) {
    // Replace 150 by whatever beat you want the character to change to
    if (curBeat == 150) {
        // Hides the first character
        oldCharacter.visible = false;
        // Shows the second character
        newCharacter.visible = true;
    }
}