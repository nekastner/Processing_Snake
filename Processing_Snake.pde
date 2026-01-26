// declare game components
GameState game_state;
Grid grid;
Snake snake;
Apples apples;

// declare frame time variables
int frame_clk;
int frame_time;
Boolean frame_input_given;
Boolean frame_paused = false;

// window configs
final int width = 17*30+2; // +2 because of rect bordersd
final int height = 15*30;

/* settings     is in Settings.pde
 * setup        is in Setup.pde
 * draw         is in Draw.pde
 * keyPressed   is in KeyPressed.pde
 */