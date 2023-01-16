# Copyright © 2023 Kasper Arnklit Frandsen - MIT License
# See `LICENSE.md` included in the source distribution for details.
tool
extends Viewport

export var generate_heightmap := false setget set_gen_height

func set_gen_height(_v) -> void:
	var img = get_viewport().get_texture().get_data()
	
	img.save_png("heightmap.png")
	
	#var tex = ImageTexture.new()
	#tex.create_from_image(img)
