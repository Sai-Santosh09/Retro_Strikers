class_name ActorsContainer extends Node2D

const PLAYER_PREFAB := preload( "res://scenes/characters/Player.tscn" )

@export var ball : Ball
@export var goal_left : Goal
@export var goal_right : Goal
@export var team_left : String
@export var team_right : String

@onready var spawns: Node2D = %Spawns


func _ready() -> void:
	spawn_players( team_left, goal_left )
	spawns.scale.x = -1
	spawn_players( team_right, goal_right )
	
	var player : Player = get_children().filter(func(p) : return p is Player)[4]
	player.control_scheme = Player.ControlScheme.P1
	player.set_control_texture()


func spawn_players( country : String, goal : Goal ) -> void:
	var players := DataLoader.get_squad( country )
	var target_goal := goal_right if goal == goal_left else goal_left
	for i in players.size():
		var player_position := spawns.get_child( i ).global_position as Vector2
		var player_data := players[ i ] as PlayerResource
		var player := spawn_player( player_position, goal, target_goal, player_data, country )
		add_child( player )
		


func spawn_player( player_position : Vector2, goal : Goal, target_goal : Goal, player_data : PlayerResource, country : String ) -> Player:
	var player := PLAYER_PREFAB.instantiate()
	player.initialize( player_position, ball, goal , target_goal, player_data, country )
	return player
