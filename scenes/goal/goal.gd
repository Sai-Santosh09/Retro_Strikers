class_name Goal extends Node2D


@onready var back_net_area: Area2D = $BackNetArea
@onready var targets: Node2D = %Targets


func _ready() -> void:
	back_net_area.body_entered.connect(on_ball_enter_back_net.bind())


func on_ball_enter_back_net(ball : Ball) -> void:
	ball.stop()


func get_random_target_position() -> Vector2:
	var children := targets.get_children()
	if children.is_empty():
		return global_position
	return children.pick_random().global_position


func get_center_target_position() -> Vector2:
	return targets.get_child( int( targets.get_child_count() / 2.0 ) ).global_position
