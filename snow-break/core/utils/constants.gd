extends Node

# File paths
const SAVE_FILE_PATH = "user://highscores.save"
const SAVE_SOUND_SETTINGS_PATH = "user://sound_settings.save"

# Score system
const MAX_TOP_SCORES = 5
const INIT_LIVES = 5
const LEVEL_UP_POINTS = 5
const BRICK_NORMAL_POINTS = 1
const BRICK_POWERUP_POINTS = 3

# Window settings
const WINDOW_WIDTH = 800
const WINDOW_HEIGHT = 600

# Sound Manager
const MAX_MASTER_VOLUME = 1.0
const MAX_SFX_VOLUME = 1.0
const MAX_MUSIC_VOLUME = 1.0

# Player settings
const PADDLE_SPEED = 5 # TODO: this is a placeholder for now
const PADDLE_HEIGHT = 32
const PADDLE_WIDTH = 128
const PADDLE_POS = Vector2(336, 568) 
const PADDLE_MIN_X = 0
const PADDLE_MAX_X = 672

# Ball settings
const BALL_INIT_SPEED = 5 # TODO: this is a placeholder for now
const BALL_MAX_SPEED = 10
const BALL_ACCELERATION = 0.1
const BALL_HEIGHT = 16
const BALL_WIDTH = 16
const BALL_POS = Vector2(392, 552)
const BALL_INIT_VECTOR = Vector2(0, -1) # up
const MIN_BOUNCE_ANGLE = deg_to_rad(-60)
const MAX_BOUNCE_ANGLE = deg_to_rad(60)
const BALL_MIN_X = 0
const BALL_MAX_X = 784
const BALL_MIN_Y = 0
const BALL_MAX_Y = 584

# Brick settings
const BRICK_HEIGHT = 32
const BRICK_WIDTH = 32
const BRICK_INIT_COLS = 25
const BRICK_INIT_ROWS = 3
