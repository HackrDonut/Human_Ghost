extends Node2D

var peer = ENetMultiplayerPeer.new()
@export var player_scene: PackedScene
@export var ghost_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	peer.create_server(135)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_ghost)
	_add_player()
	
	peer.create_client("172.29.19.153", 135)
	multiplayer.multiplayer_peer = peer

func _add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child",player)
	
func _add_ghost(id = 1):
	var ghost = ghost_scene.instantiate()
	ghost.name = str(id)
	call_deferred("add_child",ghost)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
