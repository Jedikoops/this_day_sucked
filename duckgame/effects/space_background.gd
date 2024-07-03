extends ParallaxBackground

@onready var space_layer : ParallaxLayer = %SpaceLayer
@onready var far_stars_layer : ParallaxLayer = %FarStarsLayer
@onready var close_stars_layer : ParallaxLayer = %CloseStarsLayer
#mirroring is 240 bcuz that is the camera size for this game

func _process(delta):
	space_layer.motion_offset.y += 2 * delta
	far_stars_layer.motion_offset.y += 10 * delta
	close_stars_layer.motion_offset.y += 20 * delta
