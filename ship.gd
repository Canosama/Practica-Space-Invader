extends CharacterBody2D

var SPEED = 400.0
var Fire_Rate = 4
var time_since_last_shot = Fire_Rate  # El tiempo transcurrido desde el último disparo
@onready var _animated_sprite = $AnimatedSprite2D

var projectil = load("res://projectil.tscn")
func _process(delta):
	_animated_sprite.play("Ship")
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction: #Chequea que se este moviendo 
		velocity.x = direction * SPEED #esta linea mueve
		time_since_last_shot += delta #guarda el tiempo desde el ultimo disparo
	else:#Chequea que no se este mirando a ninguna direccion 
		velocity.x = move_toward(velocity.x, 0, SPEED)# esto frena el movimiento cuando no nos movemos(no precionamos)
		time_since_last_shot += delta#guarda el tiempo desde el ultimo disparo
	if Input.is_action_pressed("ui_accept") && time_since_last_shot >= 1.0 / Fire_Rate:
		disparar() #Dispara
		time_since_last_shot = 0  # Reiniciar la variable de tiempo desde el último disparo #Resetea el tiempo desde el ultimo disparo


	move_and_slide()

func disparar():
	var newBala = projectil.instantiate()
	get_parent().add_child(newBala)
	newBala.global_position = $PosBala.global_position
