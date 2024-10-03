extends Area2D
signal hit
var score = 0

@export var speed = 1200 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		position += velocity * delta # Update position only if there is movement
		position = position.clamp(Vector2.ZERO, screen_size) # Clamp position to screen size
func _on_body_entered(body):
	hit.emit()
	score = score + 1
	body.queue_free()
	print("score:", score)
	pass
	
