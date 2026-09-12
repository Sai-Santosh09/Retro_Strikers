class_name AIBehaviorGoalie extends AIBehavior



func perform_ai_movement() -> void:
	var total_steering_force := get_goalie_steering_force()
	total_steering_force = total_steering_force.limit_length( 1.0 )
	player.velocity = total_steering_force * player.speed
	pass


func perform_ai_decisions() -> void:
	
	pass


func get_goalie_steering_force() -> Vector2:
	return Vector2.ZERO
