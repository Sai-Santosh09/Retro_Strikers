class_name Match


var country_left : String
var country_right : String
var goals_left : int
var goals_right : int
var final_score : String
var winner : String

func _init( team_left : String, team_right : String ) -> void:
	country_left = team_left
	country_right = team_right


func is_tied() -> bool:
	return goals_left == goals_right


func has_someone_scored() -> bool:
	return goals_left > 0 or goals_right > 0


func increase_score( country_scored_on : String ) -> void:
	if country_scored_on == country_left:
		goals_right += 1
	else:
		goals_left += 1
	update_match_info()


func update_match_info() -> void:
	winner = country_left if goals_left > goals_right else country_right
	final_score = "%d - %d" % [ max( goals_left, goals_right ), min( goals_left, goals_right ) ]
