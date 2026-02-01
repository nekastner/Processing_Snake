void draw() {
    // WARN: to set the background at this point causes heavy screen flicker and game bugs (no recover from game over)
    switch (game_state)
    {
        // moved each draw scenario into own function for advanced readability
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
    // frame management
    if (millis() - frame_clk < frame_time) { return; } // skip drawGame if the time for the next frame has not come yet
    frame_clk = millis(); // set time clock to now
    frame_input_given = false; // unlock movement controls
    // game logic
    grid.reset(); // reset grid
    snake.move(); // move snake
    if (snake.lost(grid)) { game_state = GameState.GAMEOVER; } // check for game over
    for (Coord apple : apples.apples) { // for all apples
        if (snake.head.coord.x == apple.x &&
            snake.head.coord.y == apple.y) { // if snake head is on an apple
            snake.grow(); // grow snake
            apples.dispawnApple(apple); // dispawn eaten apple
            break; // do not check any other apples [prevent concurrent modification error (list size changed mid iteration)]
        }
    }
    apples.draw(grid); // draw all apples
    snake.draw(grid); // draw snake into grid
    if (apples.amountApples() < apples.applesMax) { // if new apples needs to get spawned
        apples.spawnApple(grid); // spawn apple
        apples.draw(grid); // draw all apples (including the newly spawned)
    }
    apples.draw(grid); // draw apples into grid
    background(0, 0, 0); // overdraw everthing old with black background
    grid.draw(); // draw grid into window
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
