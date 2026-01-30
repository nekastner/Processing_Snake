void draw() {

    // WARNING: to set the background at this point causes heavy screen flicker and game bugs (no recover from game over)

    switch (game_state)
    {
        case STARTMENU:
            drawStartMenu();
            break;
            
        case INGAME:
            drawGame();
            break;
        
        case PAUSEMENU:
            drawPauseMenu();
            break;

        case GAMEOVER:
            drawgameOverScreen();
            break;
    }
}

void drawStartMenu() {
    background(0, 0, 0);
    fill(255);
    text("Welcome. Press SPACE to start...", 50, 50);
}

void drawGame() {

    // break draw call if the time for the next frame has not come yet
    if (millis() - frame_clk < frame_time) { return; }

    // set time of last frame to now
    frame_clk = millis();
    frame_input_given = false;
    // prepare grid for new frame
    grid.reset();

    // move snake
    snake.move();
    // draw snakei nto grid
    snake.draw(grid);

    // check if snake left the grid
    if (snake.lost(grid)) {
        game_state = GameState.GAMEOVER;
    }
    
    // check if snake ate an apple
    for (Coord apple : apples.apples) {
        if (snake.head.coord.x == apple.x &&
            snake.head.coord.y == apple.y) {
            // grow snake
            snake.grow();
            // dispawn apple
            apples.dispawnApple(apple);
            // spawn new apple
            apples.spawnApple();
            break; // prevent concurrent modification error (list size changed mid iteration)
        }
    }
    // spawn new apple if required
    if (apples.amountApples() < apples.applesMax) {
        apples.spawnApple();
    }
    // draw apples into grid
    apples.draw(grid);

    // overdraw everthing old with black background
    background(0, 0, 0);

    // draw grid
    grid.draw();
}

void drawPauseMenu() {
    background(0, 0, 0);
    fill(255);
    text("Game paused. Press SPACE to continue...", 50, 50);
}

void drawgameOverScreen() {
    background(0, 0, 0);
    fill(255);
    text("Game over!Press SPACE to restart...", 50, 50);
}
