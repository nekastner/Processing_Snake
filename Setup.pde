void setup() {
    // setup window
    focused = true; // auto-focus window on startup
    // set size of grid
    grid = new Grid();
    grid.width = horizontal_fields;
    grid.height = vertical_fields;
    grid.diameter = fields_diameter;
    // setup game
    snake = new Snake(); // initialze snake
    apples = new Apples(grid.width, grid.height); // initialize apples
    game_state = GameState.STARTMENU; // set game state
}

void settings() {
    // INFO: size() with parameters only possible in settings(), not setup()
    // setup window
    size(horizontal_fields*fields_diameter+1, vertical_fields*fields_diameter+1); // +1, else borders of cells out of window
}
