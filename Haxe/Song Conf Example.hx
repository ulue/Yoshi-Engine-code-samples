switch(song) {
    // In case "Your-Song" is the current song. Make sure the song name is in lower case.
    case "your-song":
        // Sets the scripts used

        // In this case, the script at "Your Mod Folder/modcharts/test.hx" or "Your Mod Folder/modcharts/test.lua" is used.
        // You can also put "Mod Name:stages/stage" to use a script from another mod
        // Example that adds the default stage script
        scripts = ["Friday Night Funkin':stages/default_stage"]

        // Another example that adds the test.hx script from the modcharts folder in your mod.
        scripts = ["modcharts/test"];
}