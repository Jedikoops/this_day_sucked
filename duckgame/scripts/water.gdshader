shader_type canvas_item;

uniform sampler2D noise1 : repeat_enable;
uniform sampler2D noise2: repeat_enable;

uniform vec2 scroll1 = vec2(0.05, 0.05);
uniform vec2 scroll2 = vec2(-0.05, -0.05);

uniform float scale : hint_range(0.0, 10) = 1.0;
uniform float wavelength : hint_range(2.0, 20) = 1.0;
uniform float dist_strength : hint_range(-1, 1) = 0.2;
void fragment() {
	// Called for every pixel the material is visible on.
	float noise_col = texture(noise1, UV + scroll1 * TIME).r 
					* texture(noise2, UV + scroll2 * TIME).r ;
	vec2 myUV = UV;
	//move the images up over time
	myUV.y = myUV.y + (1.0/wavelength)* TIME;
	//modify the position of the fragment from the noise colour
	myUV = myUV + dist_strength*vec2(noise_col);
	
	vec4 pixelColor = texture(TEXTURE, myUV* scale);
	
	COLOR = pixelColor;
	
	
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
