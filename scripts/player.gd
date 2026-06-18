extends CharacterBody2D

const SPEED = 200.0
const ANIM_SPEED = 0.15

var anim_timer = 0.0

@onready var sprite = $Sprite2D

func read_input() -> Vector2:
	return Input.get_vector("left", "right", "up", "down")

func update_animation(direction: Vector2):
	if direction.y > 0:
		sprite.frame_coords.y = 0
	elif direction.y < 0:
		sprite.frame_coords.y = 1
	elif direction.x < 0:
		sprite.frame_coords.y = 2
	elif direction.x > 0:
		sprite.frame_coords.y = 3
	
	if direction != Vector2.ZERO:
		sprite.frame_coords.x = (sprite.frame_coords.x + 1) % 4
	else:
		sprite.frame_coords.x = 0

func _physics_process(delta):
	var direction = read_input()
	velocity = direction * SPEED
	move_and_slide()
	
	anim_timer += delta
	if anim_timer >= ANIM_SPEED:
		anim_timer = 0.0
		update_animation(direction)
