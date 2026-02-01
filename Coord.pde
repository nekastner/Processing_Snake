// container for x and y value (with some utils)
class Coord {
    public int x;
    public int y;

    // initialize the coords container with specific x and y values
    public Coord(int x, int y) {
        this.x = x;
        this.y = y;
    }

    // compare coord with other coord and return true if they are the same
    public boolean equals(Coord other_coord) {
        return x == other_coord.x && y == other_coord.y;
    }

    // create a copy of the coords
    // USECASE: copy by value, not reference (the same, but not identical)
    public Coord copy() {
        return new Coord(x, y);
    }
}
