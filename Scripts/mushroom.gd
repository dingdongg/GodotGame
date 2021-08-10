extends Area2D

var dead = false
var hit = false
var hp = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	 if dead == false && hit == false:
	  $AnimatedSprite.play ("idle")
	 elif dead == false && hit == true:
	   $AnimatedSprite.play ("hit")
	  
	 else:
	  $AnimatedSprite.play ("dead")
	 
	   
	   


func _on_mushroom_area_entered(area):
	if area.is_in_group ("Sword"):
		hp -= 1
		hit = true
		
		
		
	if hp == 0:
		dead = true


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "hit":
		hit = false
		
	if $AnimatedSprite.animation == "dead":
		queue_free()



