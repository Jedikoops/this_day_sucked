extends CharacterBody2D

var mousePos = Vector2.ZERO
@export var step = 2.0 #The max global position it will change by
var elapsed = 30.0
# Called when the node enters the scene tree for the first time.
func _ready():
	 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#proper rotation of the ducky characterbody2d
	#so that sprite and collision stay aligned
	if (abs(global_rotation_degrees) < 90):
		scale.y = 1
	else:
		scale.y = -1
	
	if Input.is_action_just_pressed("left_click"): 
		#get last mouse position
		mousePos = get_global_mouse_position()
	if Input.is_action_pressed("left_click"):
		# I don't know how to add delta to this code, lol
		#gets the desired vector2
		#clamps the max speed between step and changes the position
		#gets latest mousePos to wait until the next frame
		var wanty_move: Vector2 = -mousePos + get_global_mouse_position() 
		position += wanty_move.normalized() * clamp((wanty_move).length(), -step*delta, step*delta)
		mousePos = get_global_mouse_position()
		look_at(position + wanty_move)
		
