// Sample on how to change your character midsong :
// Doesn't cause any lag stutter and is seamless. You can also have two characters at the same time.

// Old character (first character)
var oldCharacter:Character = null;
var newCharacter:Character = null;

function createInFront() {
    // Sets the old character as the current character.
    oldCharacter = PlayState.dad;

    newCharacter = new Character(100, 100, "your-char");
    // Hides the new character
    newCharacter.visible = false;
    PlayState.dads.push(newCharacter);
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