# Requirements analysis – Snake-Game in Processing (Java)

## Functional requirements

### Game logic

Minimum requirements:
- [x] The snake moves over a rectangular field
- [x] The snake grows if it touches a "food" object
- [x] If the snake touches itself, the game is over

Optioinal requirements:
- [x] If the snake touches the game border, the game is over
- [ ] Alternative: If the snake touches the game border, it teleports to the oppisite site

### Controlling

Minimum requirements:
- [x] Movement over the keyboard: arrow keys or WASD

Optional requirements:
- [ ] ESC pauses the game

### Start and game over screen

Minimum requirements:
- [x] Start screen
- [x] Game over screen
- [x] Game start over a start button

Optional requirements:
- [ ] Selectable snake color
- [ ] Close game over start screen
- [ ] Score display
- [ ] Highscore display
- [ ] Player name input

### Head-up-Display

Minimum requirements:
- [ ] Current score

Optional requirements:
- [ ] Timer
- [ ] Highscore
- [ ] Key hint for pause menu

## Non-functional requirements

### Performance
- [ ] the snkae moves in intervals (ca. 120 ms)

### User experience

Minimum requirements:
- [x] Clearly visible field (clear contrasts, gib enough cells-size)

Optional requirements:
- [x] Dark mode

### Maintainability and readability of code

Minimum requirements:
- [x] Clear structuring of functions

Optional requirements:
- [x] Clear division into functional blocks, for exapmple:
  - drawSnake()
  - updateSnake()
  - checkCollision()

### Version control

Optional requirements:
- [x] Usage of Schulcampus/Moodle or other systems for version controlling

## Organizational requirements

### Field size

Minimum requirements:
- [x] Field size: 17 x 15 cells
- [x] Cells size: 30 x 30 pixel
