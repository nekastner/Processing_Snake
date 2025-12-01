class SnakePart {
  Coord coord;
  SnakePart next;

  SnakePart(Coord coord) {
    this.coord = coord;
  }
}

enum Direction {
  UP,
  RIGHT,
  DOWN,
  LEFT
}

class Snake {

    public SnakePart head;
    public color snakeColor = color(255, 0, 0);
    public Direction direction = Direction.RIGHT;

    public Snake(Coord coord) {
        head = new SnakePart(coord);
        head.next = null;
    }

    public void grow() {

        SnakePart last = head;
        while (last.next != null) {
            last = last.next;
        }

        last.next = new SnakePart(last.coord);
        last.next.next = null;
    }

    public short length() {

        short len = 1;

        SnakePart current = head;

        while (current != null) {
            len++;
            current = current.next;
        }

        return len;
    }

    public void move() {

        SnakePart head_old = this.head;

        Coord coord = new Coord((short) 0, (short) 0);

        switch (this.direction) {
            case RIGHT:
                coord.y = (short) (head_old.coord.x + 1);
                break;
            case DOWN:
                coord.x = (short) (head_old.coord.y + 1);
                break;
            case LEFT:
                coord.x = (short) (head_old.coord.x - 1);
                break;
            case UP:
                coord.y = (short) (head_old.coord.y - 1);
                break;
            default:
                println("error: invalid snake direction");
                return;
        }

        SnakePart head_new = new SnakePart(coord);
        head_new.next = head_old;
        this.head = head_new;

        SnakePart current = head;
        while (current.next != null) {
            current.coord = current.next.coord;
            current = current.next;
        }
    }

    public void draw(Grid grid) {

        SnakePart current = head;
        while(current.next != null) {
            grid.set(current.coord, this.snakeColor);
            current = current.next;
        }
    }
}