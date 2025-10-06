extends Control


func _on_reanudar_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	

func _on_salirjuego_pressed():
	get_tree().quit()
