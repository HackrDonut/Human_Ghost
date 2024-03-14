extends CharacterBody2D

var talisman = true
var closed_door = false
var push = true
var press_button = false

func _enter_tree():
	set_multiplayer_authority(name.to_int())

func _physics_process(delta):
	if is_multiplayer_authority():
		velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 400
		# print(velocity.x)
	move_and_slide()
