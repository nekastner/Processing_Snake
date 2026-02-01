// central management of game board
class Grid {
    // grid parameters
    public int width;
    public int height;
    public int diameter;
    public color backgroundColor = color(0, 0, 0);
    // grid cells
    public color[][] cells = new color[width][height];

    // initializes grid
    public Grid() {
        // set all cells to black
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                cells[x][y] = backgroundColor;
            }
        }
    }

    // draws all cells into the windows
    public void draw() {
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                stroke(255);
                fill(cells[x][y]);
                rect(x*diameter, y*diameter, diameter, diameter);
            }
        }
    }

    // sets one specific cell to one specific color
    public Boolean set(Coord coord, color c) {
        if (coord.x < 0 || coord.x >= width || coord.y < 0 || coord.y >= height) { return false; } // index must be in range
        cells[coord.x][coord.y] = c;
        return true;
    }

    // resets all cells to background
    public void reset() {
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                cells[x][y] = backgroundColor;
            }
        }
    }
}
