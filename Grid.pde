// central management of game board
class Grid {
    // WARN: call reset() before set(Coord coord, color c) or draw() if size changed, else index errors may occur
    // grid parameters
    public color backgroundColor = color(0, 0, 0);
    // grid cells
    public color[][] cells;

    // sets size and background of all cells
    public void reset() {
        cells = new color[width][height];
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                cells[x][y] = backgroundColor;
            }
        }
    }

    // sets one specific cell to one specific color
    public Boolean set(Coord coord, color c) {
        if (coord.x < 0 || coord.x >= width || coord.y < 0 || coord.y >= height) { return false; } // index must be in range
        cells[coord.x][coord.y] = c;
        return true;
    }

    // draws all cells into the windows
    public void draw() {
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                stroke(255);
                fill(cells[x][y]);
                rect(x*fields_diameter, info_bar_height+y*fields_diameter, fields_diameter, fields_diameter);
            }
        }
    }
}
