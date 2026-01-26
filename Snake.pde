// contains references to snake parts and functions for control
class Snake {

    // snake parts references
    public SnakePart head;
    public SnakePart tail;

    // colors aof different types of snake parts
    public color snakeHeadColor = color(255, 150, 150);
    public color snakeBodyColor = color(255, 0, 0);

    // direction of snake
    public Direction direction;

    // initialize snake with specific position and direction
    public Snake(Coord coord, Direction direction) {

        // create new head
        head = new SnakePart(coord);
        head.previous = null;
        head.next = null;

        // head is alos the tail in this state
        tail = head;

        // save direction
        this.direction = direction;
    }

    // let's the snake grow
    public void grow() {

        // save copy of position of tail (if reference used, every snake part is at the same position)
        Coord coord = tail.coord.copy();

        // if snake length is only one, calculate position of new snake part with moving direction
        if (length() == 1) {
            switch (direction) {
                case RIGHT: coord.x--; break;
                case DOWN:  coord.y--; break;
                case LEFT:  coord.x++; break;
                case UP:    coord.y++; break;
            }
        }
        // if snake length is more than one, calculate position of new snake part with last two snake parts (at the tail)
        else {
            coord.x += tail.coord.x - tail.previous.coord.x;
            coord.y += tail.coord.y - tail.previous.coord.y;
        }

        // create new snake part at the tail
        tail.next = new SnakePart(coord);
        tail.next.previous = tail;
        tail.next.next = null;

        // set new snake part as new tail
        tail = tail.next;
    }

    // check length of snake
    public int length() {

        // if there is not even a head (length 0, should not be possible)
        if (head == null) {
            throw new NullPointerException("Head of snake should not be able to be null");
        }

        // iterate over snake parts and count them until next part is null (tail, end of snake)
        int len = 1;
        SnakePart current = head;
        while (current.next != null) {
            len++;
            current = current.next;
        }

        return len;
    }

    public void move() {

        // move last part (tail) into previous and so on
        Coord head_coord = head.coord.copy(); // coords get coppied by reference, which is problematic for the head (only)
        SnakePart current = tail;
        while (current.previous != null) {
            current.coord = current.previous.coord;
            current = current.previous;
        }
        switch (direction) {
            case RIGHT: head_coord.x++; break;
            case DOWN:  head_coord.y++; break;
            case LEFT:  head_coord.x--; break;
            case UP:    head_coord.y--; break;
        }
        head.coord = head_coord;
    }

    // checks whether the snake left the grid or not
    public Boolean lost(Grid grid) {

        // check whether snake head left grid
        if (head.coord.x < 0 || head.coord.x >= grid.width ||
            head.coord.y < 0 || head.coord.y >= grid.height) {
            return true;
        }

        // check whether other snake part left grid
        SnakePart current = head.next;
        while (current != null) {
            if (head.coord.x == current.coord.x &&
                head.coord.y == current.coord.y) {
                return true;
            }
            current = current.next;
        }

        return false;
    }

    // draw into grid
    public void draw(Grid grid) {
        SnakePart current = head;
        grid.set(current.coord, snakeHeadColor);
        current = current.next;
        while(current != null) {
            grid.set(current.coord, snakeBodyColor);
            current = current.next;
        }
    }
}