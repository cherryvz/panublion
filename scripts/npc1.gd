extends CharacterBody2D

var player_near = false

func _ready():
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)

func _process(_delta):
	if player_near and Input.is_action_just_pressed("interact"):
		$Panel.show()
		$Panel/Label.text = "Hello!"

func _on_body_entered(body):
	if body.name == "Player":
		player_near = true
		print("Player is near")

func _on_body_exited(body):
	if body.name == "Player":
		player_near = false
		print("Player left")
		$Panel.hide()
		
		
func _label():
	$Panel.hide()
