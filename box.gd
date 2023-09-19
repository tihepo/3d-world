@tool
extends StaticBody3D

@export var custom_size : Vector3 = Vector3(1, 1, 1):
	set(value):
		custom_size = value
		$MeshInstance3D.mesh = BoxMesh.new()
		$CollisionShape3D.shape = BoxShape3D.new()
		$MeshInstance3D.mesh.size = value
		$CollisionShape3D.shape.size = value
