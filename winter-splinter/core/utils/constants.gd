extends Node

# File paths
const SAVE_FILE_PATH = "user://highscores.save"
const SAVE_SOUND_SETTINGS_PATH = "user://sound_settings.save"

# Window settings
const WINDOW_WIDTH = 800
const WINDOW_HEIGHT = 600

# TODO: research how to import this enum class in game_manager
# Game states
enum GameState {
	MENU,
	PLAYING,
	PAUSED,
	GAME_OVER,
	LEVEL_UP,
}

# Score system
const MAX_TOP_SCORES = 5
const INIT_LIVES = 5
const BRICK_NORMAL_POINTS = 1
const BRICK_POWERUP_POINTS = 3
const COMBO_MULTIPLIER = 1.5
const LEVEL_UP_POINTS = 100
const PERFECT_CLEAR_BONUS = 250

# Sound Manager
const MAX_MASTER_VOLUME = 1.0
const MAX_SFX_VOLUME = 1.0
const MAX_MUSIC_VOLUME = 1.0

# Paddle settings
const PADDLE_SPEED = 400.0
const PADDLE_HEIGHT = 20 * 1.5
const PADDLE_WIDTH = 120 * 1.5
const PADDLE_POS = Vector2(310, 550) 
const PADDLE_MIN_X = 0
const PADDLE_MAX_X = 672

# Snowball settings
const BALL_INIT_SPEED = 250
const BALL_MAX_SPEED = 10
const BALL_ACCELERATION = 0.1
const BALL_HEIGHT = 20
const BALL_WIDTH = 20
const BALL_POS = Vector2(400, 540)
const BALL_INIT_VECTOR = Vector2(0.5, -1)
const MIN_BOUNCE_ANGLE = deg_to_rad(-60)
const MAX_BOUNCE_ANGLE = deg_to_rad(60)
const BALL_MIN_X = 0
const BALL_MAX_X = 784
const BALL_MIN_Y = 0
const BALL_MAX_Y = 584

# Brick settings
const BRICK_HEIGHT = 32
const BRICK_WIDTH = 64
const BRICK_INIT_COLS = 24
const BRICK_INIT_ROWS = 3
const BRICK_MARGIN = 2
const BRICK_TOP_OFFSET = 50
const BRICK_TYPES = {
	"NORMAL": 0,
	"POWER_UP": 1,
	"UNBREAKABLE": 2
}

# Scores
const INITIAL_LEVEL = 1
const INITIAL_HEALTHBAR = 3
const INITIAL_SCORE = 0
