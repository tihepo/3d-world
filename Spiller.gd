extends RigidBody3D

var speed = 500.0
var mouse_sensitivity = 0.1
var camera_rotation = Vector2()

@onready var camera = $Camera3D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		camera_rotation.x -= event.relative.x * mouse_sensitivity
		camera_rotation.y -= event.relative.y * mouse_sensitivity
		camera_rotation.y = clamp(camera_rotation.y, -70, 70)
		
		camera.rotation_degrees.x = camera_rotation.y
		camera.global_rotation_degrees.y = camera_rotation.x
		
#		self.transform.basis = self.transform.basis.rotated(Vector3(0,1,0), deg_to_rad(camera_rotation.x))

func _physics_process(delta):
	var velocity = Vector3(0, 0, 0)

	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_up"):
		velocity.z -= speed
	if Input.is_action_pressed("ui_down"):
		velocity.z += speed

	self.linear_velocity = delta * velocity
