extends CharacterBody2D

var velocidad = Vector2(0, -200) # velocidad hacia arriba en el eje Y
var lifetime = 5.0 # tiempo de vida en segundos
var age = 0.0 # tiempo transcurrido desde que se creó el proyectil
@onready var balaAnimada=$AnimatedSprite2D

func _physics_process(delta):
	balaAnimada.play("Bala")
	
	# Mover el proyectil en la dirección y velocidad especificadas
	position += velocidad * delta
	
	# Actualizar el tiempo transcurrido
	age += delta
	
	# Si ha pasado el tiempo de vida, destruir el proyectil
	if age >= lifetime:
		queue_free()
