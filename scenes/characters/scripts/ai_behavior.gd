class_name AIBehavior extends Node


const AI_TICK_FREQUENCY := 200

var ball : Ball = null
var player : Player = null
var time_since_last_ai_tick := Time.get_ticks_msec()


func _ready() -> void:
	time_since_last_ai_tick = Time.get_ticks_msec() + randi_range( 0, AI_TICK_FREQUENCY )


func setup( context_player : Player, context_ball : Ball ) -> void:
	ball = context_ball
	player = context_player


func process_ai() -> void:
	if Time.get_ticks_msec() - time_since_last_ai_tick > AI_TICK_FREQUENCY:
		time_since_last_ai_tick = Time.get_ticks_msec()
		perform_ai_movement()
		perform_ai_decisions()
	pass


func perform_ai_movement() -> void:
	print( name + " Moving" )
	pass


func perform_ai_decisions() -> void:
	
	pass
