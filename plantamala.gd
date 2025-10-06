extends Area2D

var global_vars = preload("res://global_script.gd")
@onready var _animarplanta: AnimatedSprite2D = $animacionPlantaMala


func _on_area_entered(area):
	if GlobalScript.vidaplanta1 == 1:
		_animarplanta.play("deadplanta")
		$plantamuriendo.play()		
	else: 
		GlobalScript.vidaplanta1 -= 1
		print(GlobalScript.vidaplanta1 )		
		_animarplanta.play("dolorplanta")
		$dolorplanta.play()

func _on_animacion_planta_mala_animation_finished(anim_name):
	if anim_name == "dolorplanta":
		_animarplanta.play("idle")	#if GlobalScript.pego:	
	else:
		_animarplanta.play("dolorplanta")


func _on_plantamuriendo_finished():
	_animarplanta.stop()
	queue_free()
	GlobalScript.vidaplanta1 = 4

func _on_dolorplanta_finished():
	_animarplanta.stop()
	_animarplanta.play("idle")
