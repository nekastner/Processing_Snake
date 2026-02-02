// snake parts container and snake control
class Snake {
    // settings
    public Coord spawnPosition = new Coord(1, 1);
    public Direction spawnDirection = Direction.RIGHT;
    // snake parts references
    public SnakePart head;
    public SnakePart tail;
    // colors of different types of snake parts
    public color snakeHeadColor = color(255, 150, 150);
    public color snakeBodyColor = color(255, 0, 0);
    // direction of snake
    public Direction direction;

    // initialize snake with optional parameters [function-overload on constructor]
    public Snake(Coord spawnPosition, Direction spawnDirection) { // main constructor (all other constructors call this one)
        if (spawnPosition != null) { this.spawnPosition = spawnPosition; }
        if (spawnDirection != null) { this.spawnDirection = spawnDirection; }
        setup();
    }
    public Snake(Coord spawnPosition) {
        this(spawnPosition, null); // calls Snake(Coord spawnPosition, Direction spawnDirection)
    }
    public Snake(Direction spawnDirection) {
        this(null, spawnDirection); // calls Snake(Coord spawnPosition, Direction spawnDirection)
    }
    public Snake() {
        this(null, null); // calls Snake(Coord spawnPosition, Direction spawnDirection)
    }

    // setup or reset snake parts and movement direction
    public void setup() {
        // INFO: everything else (colors, spawn position and direction) stays the same
        head = new SnakePart(spawnPosition); // create new head
        head.previous = null; // no previous part
        head.next = null; // no next part
        tail = head; // head is also the tail in this state
        direction = spawnDirection; // set direction
    }

    public void grow() {
        // WARN: if reference used instead of value for coord copy, every snake part is at the same position
        Coord coord = tail.coord.copy(); // save copy of position of tail
        // calculate position of new part at tail
        if (length() == 1) { // if snake length is only one
            switch (direction) {
                // calculate position of new snake part with moving direction
                case RIGHT: coord.x--; break;
                case DOWN:  coord.y--; break;
                case LEFT:  coord.x++; break;
                case UP:    coord.y++; break;
            }
        }
        else { // if snake length is more than one
            // calculate position of new snake part with last two snake parts (at the tail)
            coord.x += tail.coord.x - tail.previous.coord.x;
            coord.y += tail.coord.y - tail.previous.coord.y;
        }
        // create new snake part at the tail
        tail.next = new SnakePart(coord); // append new part to the tail
        tail.next.previous = tail; // set previous part of new part to current tail
        tail.next.next = null; // no next part of new part
        tail = tail.next;// set tail to new snake part
    }

    public int length() {
        if (head == null) { // if there is not even a head
            throw new NullPointerException("Head of snake must not be null!"); // throw error, invalid
        }
        // iterate over snake parts and count them until next part is null (tail, end of snake)
        SnakePart current = head;
        int len = 1; // head already counted
        while (current.next != null) {
            len++;
            current = current.next; // set current to next snake part for next iteration
        }
        return len;
    }

    // moves entire snake by one cell
    public void move() {
        // move last part (tail) into previous part and so on
        Coord head_coord = head.coord.copy(); // copy coord of snake head
        SnakePart current = tail;
        // iterate of snkae parts and move their coords into each other
        while (current.previous != null) {
            current.coord = current.previous.coord; // copy coord of of previous into current by refernce (no problem)
            current = current.previous; // set current to previous snake part for next iteration
        }
        // calculate new snake head coord from copy
        switch (direction) {
            case RIGHT: head_coord.x++; break;
            case DOWN:  head_coord.y++; break;
            case LEFT:  head_coord.x--; break;
            case UP:    head_coord.y--; break;
        }
        head.coord = head_coord; // set new snake head coord
    }

    // checks whether the snake head left the grid or crashed into itself
    public Boolean lost() {
        // check whether snake head left grid
        if (head.coord.x < 0 || head.coord.x >= fields.x ||
            head.coord.y < 0 || head.coord.y >= fields.y) {
            return true;
        }
        // check whether snake head is over other nsake part
        SnakePart current = head.next;
        while (current != null) {
            if (head.coord.x == current.coord.x &&
                head.coord.y == current.coord.y) {
                return true;
            }
            current = current.next;
        }
        // all good
        return false;
    }

    // draw snake into grid
    public void draw(Grid grid) {
        SnakePart current = head;
        grid.set(current.coord, snakeHeadColor); // draw head (because of other color not in loop)
        // draw all other parts
        current = current.next;
        while(current != null) {
            grid.set(current.coord, snakeBodyColor);
            current = current.next;
        }
    }
}
