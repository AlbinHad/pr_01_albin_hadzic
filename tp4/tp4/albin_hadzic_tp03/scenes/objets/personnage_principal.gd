extends CharacterBody2D
@onready var sprite_2d: = $Sprite2D


var SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var sfx_jump: AudioStreamPlayer2D = $sfx_jump

func jump ():
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _physics_process(delta: float) -> void:
	
	if velocity.x > 1 or velocity.x < -1:
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"

	
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"

	# Gestion du saut
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sfx_jump.play()

	
	var direction = Input.get_axis("left", "right")

	
	if direction != 0.0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0,12)

	
	move_and_slide() 
	var isLeft = velocity.x<0
	sprite_2d.flip_h = isLeft

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "CharacterBody2D": # nom de ton joueur
		body.SPEED = 700.0
		print("🍉 Melon ramassé ! Vitesse augmentée.")
		queue_free()
