void draw() {
    // WARN: to set the background at this point causes heavy screen flicker and game bugs (no recover from game over)
    switch (game_state)
    {
        // moved each draw scenario into own function for advanced readability
        case STARTMENU:
            drawText("Welcome. Press SPACE to start...");
            break;
        case INGAME:
            drawGame();
            break;
        case PAUSEMENU:
            drawText("Game paused. Press SPACE to continue...");
            break;
        case GAMEOVER:
            drawText("Game over! Press SPACE to restart...");
            break;
    }
}

void drawText(String text) {
    background(0, 0, 0);
    fill(255);
    textSize(16);
    text(text, 50, 50);
    text("Press ESC to quit.", 50, 100);
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
        if (apples.spawnApple(grid)) { apples.draw(grid); } // spawn apple and draw all apples again (if spawned successfully)
        else { println("No apple could be spawned!"); } // if no apple could be spawned
    }
    apples.draw(grid); // draw apples into grid
    background(0, 0, 0); // overdraw everthing old with black background
    grid.draw(); // draw grid into window
}
