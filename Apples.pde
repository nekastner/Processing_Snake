class Apples {

    public short gridWidth;
    public short gridHeight;
    public color appleColor = color(0, 255, 0);

    public ArrayList<Coord> apples = new ArrayList<Coord>();

    public Apples(short gridWidth, short gridHeight) {
        this.gridWidth = gridWidth;
        this.gridHeight = gridHeight;
    }

    public void spawnApple() {
        apples.add(new Coord((short) random(0, this.gridWidth), (short) random(0, this.gridHeight)));
    }

    public void dispawnApple(Coord coord) {
        apples.remove(coord);
    }

    public void draw(Grid grid) {
        for (Coord apple : apples) {
            grid.set(apple, this.appleColor);
        }
    }
}