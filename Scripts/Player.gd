extends Node2D
onready var animated_sprite = $AnimatedSprite

var velocity = Vector2.ZERO
var max_run = 400
var run_accel = 800

var isAtk = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = sign(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))

#for flipping image
	if direction <0 && isAtk == false:
		animated_sprite.flip_h = false
		get_node("AttackArea").set_scale(Vector2(-1, 1))
		
	elif direction >0&& isAtk == false:
		animated_sprite.flip_h=true
		get_node("AttackArea").set_scale(Vector2(1, 1))
#
	if direction ==0 && isAtk ==false:
		animated_sprite.play("idle")
			

	elif direction >0 || direction <0:
		animated_sprite.play ("run")
		isAtk = false

	# i cant make it so that i stop moving when i press an attack button
	if Input.is_action_pressed("ability_1"):
		animated_sprite.play ("animationtest")
		isAtk = true
		direction =0
	if Input.is_action_pressed("ability_1") && (direction >0 || direction <0):
		animated_sprite.play ("animationtest")
		isAtk = true
		direction =0
	if Input.is_action_pressed("ability_2"):
		animated_sprite.play ("light_bow")
		isAtk = true
		direction =0
		
	if Input.is_action_pressed("ability_3"):
		animated_sprite.play ("atk1")
		isAtk = true
		
		$AttackArea/CollisionShape2D.disabled = false
		direction =0
	
		
	velocity.x = move_toward (velocity.x, max_run *direction, run_accel *delta )
	global_position.x += (velocity.x * delta)
	


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "atk1":
		$AttackArea/CollisionShape2D.disabled = true
		isAtk = false
