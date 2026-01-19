void setup() {

    // define game components
    grid = new Grid();
    snake = new Snake(new Coord(1, 1), Direction.RIGHT);
    apples = new Apples(grid.width, grid.height);

    // define frame time variables
    frame_clk = millis();
    frame_time = 120;
    frame_input_given = false;

    // TODO: use variables for game dimensions

    // set size of window
    size(17*30+2, 15*30); // x-axis + 2, else border invisible

    // set size of grid
    grid.width = 17;
    grid.height = 15;
    grid.diameter = 30;

    // auto-focus window on startup
    focused = true;

    // set game state
    game_state = GameState.INGAME;

    // spawn first apple
    apples.spawnApple();
}
