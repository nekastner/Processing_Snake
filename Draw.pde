void draw() {

    // break draw call if the time for the next frame has not come yet
    if (millis() - frame_clk < frame_time) { return; }

    // set time of last frame to now
    frame_clk = millis();
    frame_input_given = false;

    // overdraw everthing old with black background and reset grid
    background(0, 0, 0);
    grid.reset();

    // move snake
    snake.move();
    snake.draw(grid);

    // check if snake left the grid
    if (snake.lost(grid)) {
        println("Game Over! Score: " + snake.length());
        noLoop();
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

    // set every component in the grid and draw it
    apples.draw(grid);
    grid.draw();
}
