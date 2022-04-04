extends KinematicBody2D

var base_speed = 125
var speed = Vector2.ZERO
var gravity = Vector2.DOWN * 980
var jump = Vector2.UP * 500
var available_jumps = 0
onready var skin = $AnimatedSprite

func _ready():
	position = Vector2(100, 500)
	
		
func _physics_process(delta):
	speed.x = 0
	if Input.is_action_pressed("move_left"):
		speed += Vector2.LEFT * base_speed
	if Input.is_action_pressed("move_right"):
		speed += Vector2.RIGHT * base_speed

	if Input.is_action_just_pressed("jump") and is_on_floor():
		speed.y = jump.y
	if Input.is_action_just_pressed("jump") and is_on_wall():
		speed.y = jump.y
	speed += gravity * delta
	speed = move_and_slide(speed, Vector2.UP)
	anima(speed)
	if is_on_floor():
		available_jumps = 2
	
	if position.y > 1000:
		position = Vector2(100, 500)

func anima(speed):
	if speed.x > 0.1:
		skin.flip_h = false
		skin.play("walk")
	if speed.x < -0.1:
		skin.flip_h = true
		skin.play("walk")
	if speed.y > 0.5 or speed.y < -0.5:
		skin.play("jump")
	if speed.x < 0.1 and -0.1 < speed.x:
		skin.play("idle")

