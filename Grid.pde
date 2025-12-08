class Grid {

    public int diameter = 30;
    public int width = 17;
    public int height = 15;
    public color backgroundColor = color(0, 0, 0);

    public color[][] cells = new color[width][height];

    public Grid() {
        
        // set all cells to black
        for (int i = 0; i < this.width; i++) {
            for (int j = 0; j < this.height; j++) {
                cells[i][j] = backgroundColor;
            }
        }
    }

    public void draw() {

        for (int x = 0; x < this.width; x++) {
            for (int y = 0; y < this.height; y++) {
                stroke(255);
                fill(cells[x][y]);
                rect(
                    x * diameter,
                    y * diameter,
                    diameter,
                    diameter
                );
            }
        }
    }

    public void set(Coord coord, color c) {

        this.cells[coord.x][coord.y] = c;
    }

    public void reset() {

        for (int x = 0; x < this.width; x++) {
            for (int y = 0; y < this.height; y++) {
                cells[x][y] = backgroundColor;
            }
        }
    }
}