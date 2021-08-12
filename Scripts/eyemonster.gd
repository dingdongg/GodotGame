extends Area2D

var dead = false
var hit = false
var hp = 4
onready var deathNoise = $monsterdead



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	 if dead == false && hit == false:
	  $AnimatedSprite.play ("idle")
	 
	 elif dead == false && hit == true:
	   $AnimatedSprite.play ("hit")
	   $"monsterhurt".play()
	 else:
	  
	 
	  
	  $AnimatedSprite.play ("dead")
	  
	

func _on_eyemonster_area_entered(area):
	if area.is_in_group ("Sword"):
		hp -= 1
		hit = true
		
	
		
	if hp == 0:
		
		dead = true
		deathNoise.play()
		

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "hit":
		hit = false
		
	if $AnimatedSprite.animation == "dead":
		
	
		
		
		call_deferred('free')
		
	

