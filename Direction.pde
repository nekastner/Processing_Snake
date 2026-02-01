// all possible directions of snakes (with some utils)
enum Direction {
    UP((byte)1),
    DOWN((byte)1),
    LEFT((byte)2),
    RIGHT((byte)2);

    public final byte loc; // line of action

    // auto-sets loc on use of Direction
    private Direction(byte loc) {
        this.loc = loc;
    }

    // checks whether another direction has the same loc, the orientation is irrelevant (both would be invalid for the game)
    public boolean isSameLoc(Direction otherDirection) {
        return this.loc == otherDirection.loc;
    }
}
