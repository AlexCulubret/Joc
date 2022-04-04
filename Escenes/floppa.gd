extends KinematicBody2D

var base_speed = 125
var speed = Vector2.ZERO
var gravity = Vector2.DOWN * 980
var jump = Vector2.UP * 500


func _ready():
	position = Vector2(400, 500)
	
func _physics_process(delta):
	speed += gravity * delta
	speed = move_and_slide(speed, Vector2.UP)

