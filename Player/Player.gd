extends KinematicBody

onready var Camera = $Pivot/Camera

var gravity = -30
var max_speed = 5
var mouse_sensitivity = 0.002
var mouse_range = 2

var velocity = Vector3()
var keys = []
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Pivot/Camera.current = true 
	

func get_input():
	var input_dir = Vector3()
	if Input.is_action_pressed("forward"):
		input_dir += -Camera.global_transform.basis.z
	if Input.is_action_pressed("back"):
		input_dir += Camera.global_transform.basis.z
	if Input.is_action_pressed("left"):
		input_dir += -Camera.global_transform.basis.x
	if Input.is_action_pressed("right"):
		input_dir += Camera.global_transform.basis.x
	input_dir = input_dir.normalized()
	return input_dir

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		$Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -mouse_range, mouse_range)

func _physics_process(delta):
	velocity.y += gravity * delta
	var desired_velocity = get_input() * max_speed
	
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)
	#if $Pivot.x.global_position <= -10:
		#var _scene = get_tree().change_scene("res://GameOver.tscn")
	#if Input.is_action_pressed("use"):
		#_shoot()
	#if Input.is_action_pressed("hit")
func _shoot():
	if not $Pivot/Flash.visible:
		$Pivot/Flash.show()
		$Pivot/Flash/Timer.start()
	if $Pivot/RayCast.is_colliding():
		var t = $Pivot/Raycast.get_collider()
		var p = $Pivot/Raycast.get_collision_point()
		var n = $Pivot/Raycast.get_collision_normal()
		#	decal.global_transform.origin = p
		#	decal.look_at(p + n, Vector3.UP)
func _hit():
	pass
func _on_Ball_Collection_body_entered(body):
	if body.name.substr(0, 5) == "@Ball" or body.name == "Ball":
		body.queue_free()
		Global.update_score(100)
		print(body)
		print(Global.score)
		if Global.score == 2000:
			var _scene = get_tree().change_scene("res://Maze/Level2.tscn")
