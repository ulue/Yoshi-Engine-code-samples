// This shows how to add a second dad.
// You can remove them or add them in the PlayState.dads array like this :
// If it's a Matt section, remove Shaggy from the PlayState.dads array (PlayState.dads.remove(shaggy))
// If it's a Shaggy section, remove Matt from the PlayState.dads array (PlayState.dads.remove(matt))

function createInFront() {
    // 100 is the default dad height
    var secondChar = new Character(-100, 100, "your-second-character");

    // Adds second char in the dads array making them sing dad's notes.
    PlayState.dads.push(secondChar);
    PlayState.add(secondChar);
}