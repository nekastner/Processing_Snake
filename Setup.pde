void setup() {

    // set size of grid
    grid = new Grid();
    grid.width = horizontal_fields;
    grid.height = vertical_fields;
    grid.diameter = fields_diameter;

    // define game components
    snake = new Snake();
    apples = new Apples(grid.width, grid.height);

    // auto-focus window on startup
    focused = true;

    // set game state
    game_state = GameState.STARTMENU;
}

void settings() {
    
    size(horizontal_fields*fields_diameter+2, vertical_fields*fields_diameter+2); // +2, else borders of game are out of window
}
