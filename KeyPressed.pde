void keyPressed() {

    switch (game_state) {

        case STARTMENU:
        case PAUSEMENU:
            if (key == ' ') {
                game_state = GameState.INGAME;
                frame_clk = millis();
                return;
            }
            
        case INGAME:
            if (key == ' ') {
                game_state = GameState.PAUSEMENU;
                return;
            }
            if (frame_input_given) { return; } // only one input per frame
            if (key == 'w' || key == 'W' || keyCode == UP) {
                if (snake.direction.isSameLoc(Direction.UP)) { return; }
                snake.direction = Direction.UP;
                frame_input_given = true;
            }
            else if (key == 'a' || key == 'A' || keyCode == LEFT) {
                if (snake.direction.isSameLoc(Direction.LEFT)) { return; }
                snake.direction = Direction.LEFT;
                frame_input_given = true;
            }
            else if (key == 's' || key == 'S' || keyCode == DOWN) {
                if (snake.direction.isSameLoc(Direction.DOWN)) { return; }
                snake.direction = Direction.DOWN;
                frame_input_given = true;
            }
            else if (key == 'd' || key == 'D' || keyCode == RIGHT) {
                if (snake.direction.isSameLoc(Direction.RIGHT)) { return; }
                snake.direction = Direction.RIGHT;
                frame_input_given = true;
            }
            break;

        case GAMEOVER:
            if (key == ' ') {
                game_state = GameState.INGAME;
                snake.setup(); // reset snake
                frame_clk = millis();
                return;
            }
    }
}
