// coord and previous and next part of one snake part
class SnakePart {
    // INFO: acting as bi-directional linked list (every element is a valid entry-point to the whole snake)
    Coord coord; // postition of this part only
    SnakePart next; // neighboured part in direction tail
    SnakePart previous; // neighboured part in direction head

    // initialize with specific coord
    SnakePart(Coord coord) {
        this.coord = coord;
    }
}
