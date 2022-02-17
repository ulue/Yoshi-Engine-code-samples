var stage:Stage = null;

function create() {
    stage = loadStage("stage"); // Replace stage by the name of your stage file without the extension
}

function beatHit(curBeat) {
    stage.onBeat();
}