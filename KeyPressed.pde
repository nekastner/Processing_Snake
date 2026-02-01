void keyPressed() {
    // check current game state
    switch (game_state) {
        // startmenu and pausemenu have the same controlling, so it is handled together
        case STARTMENU:
        case PAUSEMENU:
            if (key == ' ') {
                game_state = GameState.INGAME; // start/resume game
                frame_clk = millis(); // reset frame clock
                return;
            }
        case INGAME:
            if (key == ' ') {
                game_state = GameState.PAUSEMENU; // pause game
                return;
            }
            if (frame_input_given) { return; } // only one input per frame! (else 180 degrees moves possible (if your quick))
            // these if-statements are more efficient than a switch-statement, because multiple variables get checked
            if (key == 'w' || key == 'W' || keyCode == UP) {
                if (snake.direction.isSameLoc(Direction.UP)) { return; } // only valid directions
                snake.direction = Direction.UP; // set new direction for snake
                frame_input_given = true; // lock movement controls for this frame
            }
            else if (key == 'a' || key == 'A' || keyCode == LEFT) {
                if (snake.direction.isSameLoc(Direction.LEFT)) { return; }// only valid directions
                snake.direction = Direction.LEFT; // set new direction for snake
                frame_input_given = true; // lock movement controls for this frame
            }
            else if (key == 's' || key == 'S' || keyCode == DOWN) {
                if (snake.direction.isSameLoc(Direction.DOWN)) { return; }// only valid directions
                snake.direction = Direction.DOWN; // set new direction for snake
                frame_input_given = true; // lock movement controls for this frame
            }
            else if (key == 'd' || key == 'D' || keyCode == RIGHT) {
                if (snake.direction.isSameLoc(Direction.RIGHT)) { return; }// only valid directions
                snake.direction = Direction.RIGHT; // set new direction for snake
                frame_input_given = true; // lock movement controls for this frame
            }
            break;
        case GAMEOVER:
            if (key == ' ') {
                game_state = GameState.INGAME; // restart game
                snake.setup(); // reset snake
                ; // apples stay the same
                frame_clk = millis(); // reset frame clock
                return;
            }
    }
}
