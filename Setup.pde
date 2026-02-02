void setup() {
    // setup window
    focused = true; // auto-focus window on startup
    // setup game components
    grid = new Grid();
    snake = new Snake();
    apples = new Apples();
    game_state = GameState.STARTMENU; // set game state
}

void settings() {
    // INFO: size() with parameters only possible in settings(), not setup()
    // setup window
    // WARN: +1, else borders of cells out of window
    size(game_size.x+1, game_size.y+1);
}
