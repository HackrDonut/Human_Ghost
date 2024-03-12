extends CharacterBody2D

var talisman = false
var closed_door = true
var push = false
var press_button = true

func _enter_tree():
	set_multiplayer_authority(name.to_int())

func _physics_process(delta):
	if is_multiplayer_authority():
		velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 800
	move_and_slide()
