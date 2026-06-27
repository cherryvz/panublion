extends Area2D

@export var speed = 200.0
@export var direction = 1  # 1 = right, -1 = left
@export var car_col = 0    # 0-3 (which column)
@export var car_row = 0    # 0-2 (which row)

const CAR_WIDTH = 102
const CAR_HEIGHT = 203

func _ready():
	$Sprite2D.region_enabled = true
	$Sprite2D.region_rect = Rect2(
		car_col * CAR_WIDTH,
		car_row * CAR_HEIGHT,
		CAR_WIDTH,
		CAR_HEIGHT
	)
	if direction == 1:
		$Sprite2D.rotation_degrees = 90   # facing right
	elif direction == -1:
		$Sprite2D.rotation_degrees = -90  # facing left

func _physics_process(delta):
	position.x += speed * direction * delta
	if direction == 1 and position.x > 1200:
		position.x = -50
	elif direction == -1 and position.x < -50:
		position.x = 1200
