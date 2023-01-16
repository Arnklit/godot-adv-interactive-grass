# Copyright © 2023 Kasper Arnklit Frandsen - MIT License
# See `LICENSE.md` included in the source distribution for details.
extends Spatial

export var process_grass_path : NodePath
export var grass_path : NodePath
export var grass_camera_path : NodePath

var start_position : Vector3;
var last_position : Vector3 = Vector3()
var process_grass_material : ShaderMaterial
var grass_material : ShaderMaterial
var grass_camera : Camera

var viewport_resolution := 512
var viewport_size := 20.0


func _ready() -> void:
	last_position = global_transform.origin
	process_grass_material = get_node(process_grass_path).material
	grass_material = get_node(grass_path).material_override
	process_grass_material = get_node(process_grass_path).material
	grass_camera = get_node(grass_camera_path)
	start_position = global_transform.origin
	grass_camera.global_transform.origin = Vector3(global_transform.origin.x, 0.0, global_transform.origin.z)


func _process(delta: float) -> void:
	var change_vector : Vector3 = last_position - global_transform.origin
	last_position = global_transform.origin
	process_grass_material.set_shader_param("movement_vector", change_vector)
	process_grass_material.set_shader_param("camera_position", global_transform.origin)
	grass_material.set_shader_param("camera_position", global_transform.origin)
	grass_camera.global_transform.origin = Vector3(global_transform.origin.x, 0.0, global_transform.origin.z)
