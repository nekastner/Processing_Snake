// spawned and manages the apples
class Apples {

    // grid info
    public int gridWidth;
    public int gridHeight;
    public color appleColor = color(0, 255, 0);

    // list of coords of all apples
    public ArrayList<Coord> apples = new ArrayList<Coord>();

    // initialize with specific grid size
    public Apples(int gridWidth, int gridHeight) {
        this.gridWidth = gridWidth;
        this.gridHeight = gridHeight;
    }

    // get amount of apples currently existing
    public int amountApples() {
        return apples.size();
    }

    // spawn a new apple
    public void spawnApple() {
        // TODO: check if field is free (no snake, no apples)
        apples.add(
            new Coord(
                (int) random(0, this.gridWidth),
                (int) random(0, this.gridHeight)
            )
        );
    }

    // delete apple
    public void dispawnApple(Coord coord) {
        apples.remove(coord);
    }

    // draws every apple into cells
    public void draw(Grid grid) {
        for (Coord apple : apples) {
            grid.set(apple, appleColor);
        }
    }
}
