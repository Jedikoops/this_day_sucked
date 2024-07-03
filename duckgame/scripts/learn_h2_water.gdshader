shader_type canvas_item;

//you need to add "repeate_enable" if you are adding
//textures to a shader in the way a noise texture.
uniform sampler2D noise : repeat_enable;
uniform vec2 scroll = vec2(0.05, 0.05);
uniform sampler2D SCREEN_TEXTURE;
uniform float distortion_strength : hint_range(-1.0, 1.0) = 0.2;
void fragment() {
	vec4 noise_col = texture(noise, UV + scroll * TIME);
	COLOR = noise_col;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
