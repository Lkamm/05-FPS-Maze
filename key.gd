extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var color = "Red"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func use():
#	if Input.is_action_pressed("use")


func _on_key_body_entered(body):
	if body.name == "Player":
		body.keys.append(color)
		var _ding = $Ding
		_ding.play()
		queue_free()
	pass
	
