extends Node2D

var peer = ENetMultiplayerPeer.new()
@export var player_scene: PackedScene
@export var ghost_scene: PackedScene
# @export var ip = IP.resolve_hostname(str(OS.get_environment("COMPUTERNAME")),1)

func _on_host_pressed():
	peer.create_server(135)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_ghost)
	_add_player()
	# print(ip)

func _add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child",player)
	
func _add_ghost(id = 1):
	var ghost = ghost_scene.instantiate()
	ghost.name = str(id)
	call_deferred("add_child",ghost)

func _on_join_pressed():
	peer.create_client("172.29.19.153", 135)
	multiplayer.multiplayer_peer = peer


func _on_button_pressed():
	get_tree().change_scene_to_file("res://test_room.tscn")
