extends Node2D

var Ball = null

func _ready():
	Ball = load("res://Ball/Ball.tscn")
	make_ball()



func make_ball():
	var ball = Ball.instantiate()
	ball.position = Vector2(Global.VP.x/2, Global.VP.y - 100)
	var direction = Vector2(250,-250) if randf() > 0.5 else Vector2(-250,-250)
	ball.apply_central_impulse(direction)
	add_child(ball)
	

func _physics_process(_delta):
	for c in get_children():
		if c.modulate.a <= 0 or c.modulate.v <= 0:
			c.queue_free()
		c.scale *= 0.99
		c.modulate.a -= 0.03
		c.modulate.v -= 0.01
		c.modulate.h += 0.02
