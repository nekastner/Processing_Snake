class AppleSpawner {

    public short width;
    public short height;
    public color appleColor = color(0, 255, 0);

    public ArrayList<Coord> apples = new ArrayList<Coord>();

    public AppleSpawner(short width, short height) {
        this.width = width;
        this.height = height;
    }

    public void spawn() {
        apples.add(new Coord((short) random(0, this.width), (short) random(0, this.height)));
    }

    public void dispawn(Coord coord) {
        apples.remove(coord);
    }

    public void draw(Grid grid) {
        for (Coord apple : apples) {
            grid.set(apple, this.appleColor);
        }
    }
}