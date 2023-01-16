# Copyright © 2023 Kasper Arnklit Frandsen - MIT License
# See `LICENSE.md` included in the source distribution for details.
extends Camera

export var viewport_resolution := 512
export var viewport_size := 20.0

export var process_grass_path: NodePath
export var grass_path: NodePath
export var player_path: NodePath

var player_spatial: Spatial
var player_start_position: Vector3
var process_grass_material: ShaderMaterial
var grass_material: ShaderMaterial

var stepped_position: Vector3
var previous_position: Vector3

var pixel_step: float


func _ready() -> void:
	player_spatial = get_node(player_path) as Spatial
	player_start_position = player_spatial.global_transform.origin
	process_grass_material = get_node(process_grass_path).material
	grass_material = get_node(grass_path).material_override
	pixel_step = viewport_size / float(viewport_resolution)


func _process(_delta: float) -> void:
	
	var position_offset: Vector3 = player_spatial.global_transform.origin - player_start_position
	position_offset = position_offset.snapped(Vector3(pixel_step, pixel_step, pixel_step))
	var new_position = player_start_position + position_offset
	new_position.y = 0.0
	
	stepped_position = new_position
	var change_vector := previous_position - stepped_position
	previous_position = stepped_position
	
	global_transform.origin = Vector3(player_spatial.global_transform.origin.x, global_transform.origin.y, player_spatial.global_transform.origin.z)
	
	process_grass_material.set_shader_param("movement_vector", change_vector)
	process_grass_material.set_shader_param("camera_position", global_transform.origin)
	grass_material.set_shader_param("camera_position", global_transform.origin)
