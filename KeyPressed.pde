void keyPressed() {

    switch (game_state) {

        case STARTMENU:
            break;

        case INGAME:
            if (key == 'w' || key == 'W' || keyCode == UP) {
                if (snake.direction == Direction.DOWN) { return; }
                snake.direction = Direction.UP;
                frame_input_given = true;
            }
            else if (key == 'a' || key == 'A' || keyCode == LEFT) {
                if (snake.direction == Direction.RIGHT) { return; }
                snake.direction = Direction.LEFT;
                frame_input_given = true;
            }
            else if (key == 's' || key == 'S' || keyCode == DOWN) {
                if (snake.direction == Direction.UP) { return; }
                snake.direction = Direction.DOWN;
                frame_input_given = true;
            }
            else if (key == 'd' || key == 'D' || keyCode == RIGHT) {
                if (snake.direction == Direction.LEFT) { return; }
                snake.direction = Direction.RIGHT;
                frame_input_given = true;
            }
            break;

        case GAMEOVER:
            break;

        case PAUSEMENU:
            break;
    }
}
