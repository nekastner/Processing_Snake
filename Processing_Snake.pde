// configs
final int horizontal_fields = 17;
final int vertical_fields = 15;
final int fields_diameter = 30;
final int frame_time = 120;

// frame time variables
int frame_clk = 0;
Boolean frame_input_given = false;

// game components
GameState game_state;
Grid grid;
Snake snake;
Apples apples;

/* void setup()        Setup.pde
 * void settings()     Setup.pde
 * void draw()         Draw.pde
 * void keyPressed()   KeyPressed.pde
 */
