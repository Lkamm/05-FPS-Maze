extends StaticBody

export var color = "Red"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var DoorOpen = load("res://doorOpen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Unlock_body_entered(body):
	if body.name == "Player":
		if color in body.keys:
			var doorOpen = DoorOpen.instance()
			doorOpen.global_transform.origin = global_transform.origin
			var game = get_node_or_null("/root/Game")
			if game != null:
				game.add_child(doorOpen)
				get_tree().change_scene("res://Maze/Level3.tscn")
			queue_free()
