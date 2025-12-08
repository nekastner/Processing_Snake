Grid grid = new Grid();
Snake snake = new Snake(new Coord(1, 1));

int clk = millis();

void setup() {

    size(17 * 30 + 2, 15 * 30); // x axis + 2 because else border of invisible
}

void draw() {

    if (millis() - clk < 500) {
        return;
    }

    clk = millis();

    println("tick");

    background(0, 0, 0);

    snake.move();
    snake.draw(grid);

    grid.draw();
    grid.reset();
}

void keyPressed() {

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
}