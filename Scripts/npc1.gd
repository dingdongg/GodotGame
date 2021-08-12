extends Area2D



var active = false
onready var animated_sprite = $AnimatedSprite


func _process(delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start ('timeline1',false)
			add_child(dialog)
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect ("timeline_end", self, 'after_dialog')
			
			
			

func after_dialog (timeline_name):
	get_tree().paused = false
	active = false
	
func _on_npc1_area_exited(area):
	if area.is_in_group('hitbox'):
		active = false
		print (active)


func _on_npc1_area_entered(area):
	if area.is_in_group('hitbox'):
		active = true
		print (active)





func _on_left_area_entered(area):
	animated_sprite.flip_h = true
	

func _on_right_area_entered(area):
	animated_sprite.flip_h = false
	




