extends CharacterBody2D

@onready var  _toro:=$AnimationPlayer


func _physics_process(delta):
	#derecha
	if Input.is_action_pressed("toro"):
		velocity.x = 5
		_toro.play("tororun")
				
	move_and_slide()
