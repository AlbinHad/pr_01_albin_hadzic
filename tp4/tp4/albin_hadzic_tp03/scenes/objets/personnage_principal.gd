extends CharacterBody2D

@onready var sprite_2d = $Sprite2D
@onready var sfx_jump: AudioStreamPlayer2D = $sfx_jump

var SPEED = 400.0
const JUMP_VELOCITY = -900.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:

	# Gravité
	if not is_on_floor():
		velocity.y += gravity * delta

	# Déplacement horizontal (inchangé)
	var direction = Input.get_axis("left", "right")
	if direction != 0.0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 12)

	# Animations (inchangé)
	if not is_on_floor():
		sprite_2d.animation = "jumping"
	elif abs(velocity.x) > 1:
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"

	# Saut (inchangé)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sfx_jump.play()

	move_and_slide()

	sprite_2d.flip_h = velocity.x < 0


# 🔥 REBOND SUR LE CÔTÉ (corrigé, sans input)
func jump_side(x):
	velocity.y = JUMP_VELOCITY
	velocity.x = x


# 🍉 BONUS RAMASSÉ (inchangé)
func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		SPEED = 700.0
		print("🍉 Melon ramassé ! Vitesse augmentée.")
		queue_free()
