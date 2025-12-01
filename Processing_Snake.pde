Grid grid = new Grid();
Snake snake = new Snake(new Coord((short) 0, (short) 0));

void setup() {

    size(17*30, 15*30);
}

void draw() {

    background(255, 0, 0);

    grid.draw();
}
