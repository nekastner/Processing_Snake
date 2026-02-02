void draw() {
    // WARN: to set the background at this point causes heavy screen flicker and game bugs (no recover from game over)
    switch (game_state)
    {
        // moved each draw scenario into own function for advanced readability
        case STARTMENU:
            draw_info_bar("Welcome. Start: SPACE | Press ESC to quit.");
            break;
        case INGAME:
            draw_game();
            break;
        case PAUSEMENU:
            draw_info_bar("Game paused. | Continue: SPACE | Press ESC to quit.");
            break;
        case GAMEOVER:
            draw_info_bar("Game over! Restart: SPACE | Press ESC to quit.");
            grid.draw(); // does not run any further, just displays state
            break;
    }
}

void draw_info_bar(String text) {
    background(0, 0, 0);
    stroke(255);
    fill(50);
    rect(0, 0, game_size.x, info_bar_height);
    fill(255);
    textSize(16);
    text(text, 0, info_bar_height/2);
}

void draw_game() {
    // frame management
    if (millis() - frame_clk < frame_time) { return; } // skip draw_game() if the time for the next frame has not come yet
    frame_clk = millis(); // set time clock to now
    frame_input_given = false; // unlock movement controls
    // game logic
    grid.reset(); // reset grid
    snake.move(); // move snake
    if (snake.lost()) { game_state = GameState.GAMEOVER; } // check for game over
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
    draw_info_bar(String.format("Pause: SPACE | Quit: ESC | Score: %d", snake.length())); // draw info bar
    grid.draw(); // draw grid into window
}
