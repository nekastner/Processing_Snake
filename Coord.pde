// container for x and y value
class Coord {
    public int x;
    public int y;

    // initialize the coords container with specific x and y values
    public Coord(int x, int y) {
        this.x = x;
        this.y = y;
    }

    // create a copy of the coords
    public Coord copy() {
        return new Coord(x, y);
    }
}
