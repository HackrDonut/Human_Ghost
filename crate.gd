extends CharacterBody2D

func _on_area_left_body_entered(body):
	print(body.name)
	if body.name == "1":
		if Input.is_action_pressed("ui_right"):
			position.x += 5
	else:
		position.x += 0
