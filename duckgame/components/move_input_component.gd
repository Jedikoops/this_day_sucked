class_name MoveInputComponent
extends Node

#gets the input from the user and sets the 
#sets the velocity on a MoveComponent based on input you get
@export var move_stats: MoveStats
@export var move_component: MoveComponent 
#typecasting a custom class --^

func _input(event: InputEvent) -> void:
	var input_axis = Input.get_axis("move_left", "move_right")
	move_component.velocity = Vector2(input_axis * move_stats.speed, 0)

