extends Node

var score = 0
#var ball_count = Game.get_child_count(Ball)
var time = 0
var lives = 0
func _ready():
	pause_mode = PAUSE_MODE_PROCESS		# global should never be paused

func _unhandled_input(event):
	if event.is_action_pressed("menu"):	# instead of quitting, show the menu
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		var menu = get_node_or_null("/root/Game/Menu")
		if menu != null:
			if not menu.visible:
				menu.show()
				get_tree().paused = true 	# pause the game while the menu is visible
			else:
				menu.hide()
				get_tree().paused = false
func update_score(p):
	score+=p
	
func update_lives():
	lives-=1
	
