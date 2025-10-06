extends Area2D
@onready var label_vidas: Label = $LabelVidas  # Asigna la etiqueta de texto desde el editor

#var jugador = preload("res://Player.gd")
#@onready var  _animated_sprite:= jugador.
func _ready():
	label_vidas.text = "Vidas: " + str(GlobalScript.vidas)

func _on_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("grupoJugador"):
		GlobalScript.vidas -= 1
		if GlobalScript.vidas <= 0:
			#$animaciones.play("dead")
			#await("idle")			
			get_tree().change_scene_to_file("res://menureanudarysalir.tscn")
			GlobalScript.vidas=3
		else:
			label_vidas.text = "Vidas: " + str(GlobalScript.vidas)
