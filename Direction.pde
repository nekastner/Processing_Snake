// possible directions of the snake
enum Direction {
    UP(false),
    LEFT(true),
    DOWN(false),
    RIGHT(true);

    public final boolean loc; // line of action

    private Direction(boolean loc) {
        this.loc = loc;
    }

    // checks whether another direction has the same line of action, the orientation is irrelevant
    public boolean isSameLoc(Direction otherDirection) {
        return this.loc == otherDirection.loc;
    }
}
