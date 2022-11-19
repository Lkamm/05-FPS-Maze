extends Spatial


onready var Player = load("res://Player/Player.tscn")



func _ready():
	pass


func _physics_process(_delta):
	if get_child_count() == 0:
		var player = Player.instance()
		add_child(player)
