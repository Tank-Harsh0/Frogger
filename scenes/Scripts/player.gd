extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var speed: float = 35

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("Left","Right",'Up',"Down")
	animation()
	velocity = direction * speed
	move_and_slide()
		
func animation():
	if direction:
		$AnimatedSprite2D.flip_h = direction.x > 0
		if (direction.x != 0 ):
			$AnimatedSprite2D.animation = 'Left'
		else:
			$AnimatedSprite2D.animation = 'Up' if direction.y < 0 else 'Down'
	else:
		$AnimatedSprite2D.frame = 0
		
		
