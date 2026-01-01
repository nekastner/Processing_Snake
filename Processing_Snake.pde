// declare game components
Grid grid;
Snake snake;
Apples apples;

// declare frame time variables
int frame_clk;
int frame_time;

void setup() {

    // define game components
    grid = new Grid();
    snake = new Snake(new Coord(1, 1), Direction.RIGHT);
    apples = new Apples(grid.width, grid.height);

    // define frame time variables
    frame_clk = millis();
    frame_time = 250;

    // TODO: use variables for gmae dimensions

    // set size of window
    size(17*30+2, 15*30); // x-axis + 2, else border invisible

    // set size of grid
    grid.width = 17;
    grid.height = 15;
    grid.diameter = 30;

    // let grow snake before game start for testing
    for (int i = 0; i < 2; i++) {
        snake.grow();
    }

    // TODO: spawn apples in draw, not setup
    // spawn first apple
    apples.spawnApple();

    // auto-focus window on startup
    focused = true;
}

void draw() {

    // break draw call if the time for the next frame has not come yet
    if (millis() - frame_clk < frame_time) { return; }
    // set time of last frame to now
    frame_clk = millis();

    // overdraw everthing old with black background and reset grid
    background(0, 0, 0);
    grid.reset();

    // move snake
    snake.move();
    // check if snake left the grid
    if (snake.lost(grid)) {
        println("You lost! Final length: " + snake.length());
        noLoop();
    }

    // set every component in the grid and draw it
    grid.draw_apples(apples);
    grid.draw_snake(snake);
    grid.draw();
    
}

void keyPressed() {
    // TODO: prevent user from 180 degrees turn (instant suicide)

    // arrow keys
    switch (keyCode) {

        case RIGHT:
            snake.direction = Direction.RIGHT;
            break;

        case DOWN:
            snake.direction = Direction.DOWN;
            break;

        case LEFT:
            snake.direction = Direction.LEFT;
            break;

        case UP:
            snake.direction = Direction.UP;
            break;
    }

    // wasd
    switch (key) {

        case 'd':
        case 'D':
            snake.direction = Direction.RIGHT;
            break;

        case 's':
        case 'S':
            snake.direction = Direction.DOWN;
            break;

        case 'a':
        case 'A':
            snake.direction = Direction.LEFT;
            break;

        case 'w':
        case 'W':
            snake.direction = Direction.UP;
            break;
    }
}
