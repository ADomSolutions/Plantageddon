extends Area2D
var global_vars = preload("res://global_script.gd")
var speed = 1050
	
func _physics_process(delta):
	position += transform.x * speed * delta	* GlobalScript.posicionbala*GlobalScript.direccion

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


#func _on_area_entered(area):
#		queue_free()




func _on_body_entered(body):
	if body.is_in_group("grupoEnemigos"):		
		queue_free()
	#pass # Replace with function body.


func _on_timer_timeout():
	queue_free()  # Destruir la bala cuando el temporizador se agota
