// spawn and manage apples
class Apples {

    // settings
    public int applesMax = 1;

    // grid info
    public color appleColor = color(0, 255, 0);

    // list of coords of all apples
    public ArrayList<Coord> apples = new ArrayList<Coord>();

    // get amount of apples currently existing
    public int amountApples() {
        return apples.size();
    }

    // spawn a new apple
    public boolean spawnApple(Grid grid) {
        // INFO: requires everything (including itself) to be already drawn; must get drawn again to take visual effect
        // find free fields in grid
        ArrayList<Coord> free_coords = new ArrayList<Coord>(); // list of all free coords
        for (int x = 0; x < fields.x; x++) { // for each x in grid
            for (int y = 0; y < fields.y; y++) { // for each y in grid
                if (grid.cells[x][y] == grid.backgroundColor) { // if cell is empty
                    free_coords.add(new Coord(x, y)); // save coord
                }
            }
        }
        if (free_coords.size() == 0) { return false; } // if there is no free cell, spawn no apple
        apples.add(free_coords.get(int(random(free_coords.size())))); // add ramdon chosen coord as apple
        return true;
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
