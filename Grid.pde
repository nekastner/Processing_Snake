// receives all coords and draws them
class Grid {

    // grid parameters
    public int diameter = 30;
    public int width = 17;
    public int height = 15;
    public color backgroundColor = color(0, 0, 0);

    // grid cells
    public color[][] cells = new color[width][height];

    // initializes grid
    public Grid() {
        // set all cells to black
        for (int i = 0; i < width; i++) {
            for (int j = 0; j < height; j++) {
                cells[i][j] = backgroundColor;
            }
        }
    }

    // draws every apple into cells
    public void draw_apples(Apples apples) {
        for (Coord apple : apples.apples) {
            grid.set(apple, apples.appleColor);
        }
    }

    // draws the snake into cells
    public void draw_snake(Snake snake) {
        SnakePart current = snake.head;
        grid.set(current.coord, snake.snakeHeadColor);
        current = current.next;
        while(current != null) {
            grid.set(current.coord, snake.snakeBodyColor);
            current = current.next;
        }
    }

    // draws the cells into the windows
    public void draw() {
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                stroke(255);
                fill(cells[x][y]);
                rect(x * diameter, y * diameter, diameter, diameter);
            }
        }
    }

    // sets a cell in cells to a specific color
    public Boolean set(Coord coord, color c) {
        if (coord.x < 0 || coord.x >= width || coord.y < 0 || coord.y >= height) { return false; }
        cells[coord.x][coord.y] = c;
        return true;
    }

    // resets all cells to a new grid
    public void reset() {
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                cells[x][y] = backgroundColor;
            }
        }
    }
}
