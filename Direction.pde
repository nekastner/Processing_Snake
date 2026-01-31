// possible directions of the snake
enum Direction {
    UP((byte)1),
    DOWN((byte)1),
    LEFT((byte)2),
    RIGHT((byte)2);

    public final byte loc; // line of action

    private Direction(byte loc) {
        this.loc = loc;
    }

    // checks whether another direction has the same line of action, the orientation is irrelevant
    public boolean isSameLoc(Direction otherDirection) {
        return this.loc == otherDirection.loc;
    }
}
