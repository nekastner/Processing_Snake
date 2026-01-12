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

    // auto-focus window on startup
    focused = true;

    // spawn first apple
    apples.spawnApple();
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
    // check if snake ate an apple
    for (Coord apple : apples.apples) {
        if (snake.head.coord.x == apple.x &&
            snake.head.coord.y == apple.y) {
            // grow snake
            snake.grow();
            // dispawn apple
            apples.dispawnApple(apple);
            // spawn new apple
            apples.spawnApple();
            break; // prevent concurrent modification error
        }
    }

    // set every component in the grid and draw it
    apples.draw(grid);
    snake.draw(grid);
    grid.draw();
}

void keyPressed() {

    // arrow keys
    switch (keyCode) {

        case RIGHT:
            if (snake.direction == Direction.LEFT) { return; }
            snake.direction = Direction.RIGHT;
            break;

        case DOWN:
            if (snake.direction == Direction.UP) { return; }
            snake.direction = Direction.DOWN;
            break;

        case LEFT:
            if (snake.direction == Direction.RIGHT) { return; }
            snake.direction = Direction.LEFT;
            break;

        case UP:
            if (snake.direction == Direction.DOWN) { return; }
            snake.direction = Direction.UP;
            break;
    }

    // wasd
    switch (key) {

        case 'd':
        case 'D':
            if (snake.direction == Direction.LEFT) { return; }
            snake.direction = Direction.RIGHT;
            break;

        case 's':
        case 'S':
            if (snake.direction == Direction.UP) { return; }
            snake.direction = Direction.DOWN;
            break;

        case 'a':
        case 'A':
            if (snake.direction == Direction.RIGHT) { return; }
            snake.direction = Direction.LEFT;
            break;

        case 'w':
        case 'W':
            if (snake.direction == Direction.DOWN) { return; }
            snake.direction = Direction.UP;
            break;
    }
}
