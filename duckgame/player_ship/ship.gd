extends Node2D

#variable that only tries to get acces when the scene is ready
#important for children, it waits until all the children scenes are created
@onready var left_muzzle = $LeftMuzzle
@onready var right_muzzle = $RightMuzzle
@onready var spawner_component: SpawnerComponent = $SpawnerComponent
#connect the timeout signal from the timer 
@onready var fire_rate_timer = $FireRateTimer
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var animated_sprite_2d = $Anchor/AnimatedSprite2D
@onready var flame_animated_sprite = $Anchor/FlameAnimatedSprite
@onready var move_component: MoveComponent = $MoveComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	#Godot accidentally autocompletes fire_lasers() !!
	fire_rate_timer.timeout.connect(fire_lasers)
	pass # Replace with function body.

func fire_lasers() -> void:
	#there is a second method where you create two spawner comonent
	#and have them autospawn with the timer
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
	scale_component.tween_scale()
	
func _process(delta) -> void:
	animate_the_ship()
	
	
func animate_the_ship() -> void: # could be component; no reason y.
	if move_component.velocity.x < 0:
		animated_sprite_2d.play("left")
		flame_animated_sprite.play("left")
	elif move_component.velocity.x > 0:
		animated_sprite_2d.play("right")
		flame_animated_sprite.play("right")
	else:
		animated_sprite_2d.play("center")
		flame_animated_sprite.play("center")
	
