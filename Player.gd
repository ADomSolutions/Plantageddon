extends CharacterBody2D
class_name players
var velocidad = 200
const gravedad = 400
var salto = 250
var has_jumped = false
var mirar = "derecha"
#var GlobalScript = preload("res://global_script.gd")
var global_Script = preload("res://global_script.gd")
#llamo a cargar a la bala
var bala = preload("res://bala.tscn")
signal disparos(bala,ubicacion)
@onready var muzzle =$Muzzle
@onready var  _animated_sprite:=$animaciones

func _process(delta):
	if Input.is_action_just_pressed("disparar"):
		shoot()
#pass

func _physics_process(delta):
	velocity.y += gravedad * delta
	#derecha
	if Input.is_action_pressed("derecha"):
		velocity.x = velocidad
		mirar = "derecha"
		GlobalScript.direccion=1			
		$animaciones.play("run")
		$animaciones.flip_h=false		
	#izquierda	
	elif Input.is_action_pressed("izquierda"):
		velocity.x =-velocidad		
		mirar = "izquierda"	
		GlobalScript.direccion=-1
		$animaciones.play("run")
		$animaciones.flip_h=true
		
	#saltar	
	elif  Input.is_action_pressed("saltar") and not has_jumped:
		velocity.y =-gravedad	
		has_jumped = true
		$ruidosalto.play()
	#quedarse quieto					
	else:
		$animaciones.play("idle")
		velocity.x =0
		#_animarplanta.play("idle")esto agregue
		
	#si esta en el piso salta
	if is_on_floor():
		has_jumped = false
		if Input.is_action_just_pressed("saltar"):
			velocity.y= -salto	
	
	move_and_slide()
	
func disparar():
	disparos.emit(bala,muzzle.global_position)
	
func shoot():	
	var b = bala.instantiate()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform	
	$disparo1.play()


func _on_pjherido_finished():
	$animaciones.play("damage")


func _on_pjmuriendo_finished():
	$animaciones.play("dead")
	#get_tree().change_scene_to_file("res://menureanudarysalir.tscn")




func _on_area_2d_area_entered(area):
	if GlobalScript.vidas == 0:
		$pjmuriendo.play()
				
	if GlobalScript.vidas > 0:	
			GlobalScript.vidas = GlobalScript.vidas- 1			
			$pjherido.play()
