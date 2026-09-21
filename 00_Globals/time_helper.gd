class_name TimeHelper

static var is_overtime : bool = false
static var is_running : bool = false

static func get_time_text( time_left : float ) -> String:
	if time_left < 0:
		is_overtime = true
		return "OVERTIME!"
	else:
		is_overtime = false
		var minutes := int( time_left / 60.0 )
		var seconds := time_left - minutes * 60
		return "%02d : %02d" % [ minutes, seconds ]


static func reset() -> void:
	is_overtime = false
	is_running = false
