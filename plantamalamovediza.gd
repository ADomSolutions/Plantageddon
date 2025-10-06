extends Area2D

#var enemyScene = preload("res://animacionPlantaMala.gd") # Cambia la ruta a la escena del enemigo

func _ready():
	$plantitamovediza.play("moverplanta")

func _on_body_entered(body):
	if body.is_in_group("grupoJugador"):
		GlobalScript.vidas -=1
		
		#spawn_enemy()  # Llama a la función para hacer aparecer un enemigo
		#get_tree().change_scene_to_file("res://menureanudarysalir.tscn")

func spawn_enemy():
	pass
	#var enemy_instance = load("res://animacionPlantaMala.gd").instance()
	#get_parent().add_child( enemy_instance)
	
	#var enemy_instance = enemyScene.instance()
	#get_parent().add_child(enemy_instance)  # Añade el enemigo al mismo nivel que el área (puede variar dependiendo de tu estructura)
	#enemy_instance.position = position  # Puedes ajustar la posición del enemigo según tus necesidades
