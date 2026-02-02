// setting
final int info_bar_height = 50;
final Coord fields = new Coord(17, 15);
final int fields_diameter = 30;
final int frame_time = 120;

// resulting
// WARN: do not change!
final Coord game_size = new Coord(fields.x*fields_diameter, info_bar_height+fields.y*fields_diameter);

// frame time variables
// WARN: do not change!
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
