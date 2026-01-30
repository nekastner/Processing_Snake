/* part of the snake
 * acting as bi-directional linked list with multiple entry points
 * (every element is an entry point to the whole snake)
 */
class SnakePart {

Coord coord; // postition of this part only
  
  SnakePart next; // neighboured part in direction tail
  SnakePart previous; // neighboured part in direction head

  // initialize with specific coord
  SnakePart(Coord coord) {
    this.coord = coord;
  }
}